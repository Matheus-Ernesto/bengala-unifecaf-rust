#include "esp_camera.h"
#include <WiFi.h>
#include <ArduinoWebsockets.h>
#include "soc/rtc.h"
#include "esp_heap_caps.h"

TaskHandle_t Task1;  // Core 0
TaskHandle_t Task2;  // Core 1

using namespace websockets;

// ===== CONFIGURAÇÕES DE REDE =====
const char* ssid = "CASA-2.4G";
const char* password = "25122003";
const char* ws_host = "192.168.10.4";
const uint16_t ws_port = 8765;
// =================================

// ===== PINOS DO ULTRASSÔNICO =====
#define TRIG_PIN 14
#define ECHO_PIN 15
// =================================

WebsocketsClient client;
volatile bool wsConnected = false;
volatile bool wsShouldReconnect = false;
unsigned long lastWsReconnectAttempt = 0;
const unsigned long wsReconnectIntervalMs = 2000;

camera_config_t config = {
  .pin_pwdn       = 32,
  .pin_reset      = -1,
  .pin_xclk       = 0,
  .pin_sscb_sda   = 26,
  .pin_sscb_scl   = 27,
  .pin_d7         = 35,
  .pin_d6         = 34,
  .pin_d5         = 39,
  .pin_d4         = 36,
  .pin_d3         = 21,
  .pin_d2         = 19,
  .pin_d1         = 18,
  .pin_d0         = 5,
  .pin_vsync      = 25,
  .pin_href       = 23,
  .pin_pclk       = 22,
  .xclk_freq_hz   = 20000000,
  .ledc_timer     = LEDC_TIMER_0,
  .ledc_channel   = LEDC_CHANNEL_0,
  .pixel_format   = PIXFORMAT_JPEG,
  .frame_size     = FRAMESIZE_QVGA,
  .jpeg_quality   = 40,
  .fb_count       = 1
};

// ===== Funções =====
void conectarWiFi() {
  WiFi.begin(ssid, password);
  Serial.print("Conectando Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    vTaskDelay(250 / portTICK_PERIOD_MS);
    Serial.print(".");
  }
  Serial.println("\nWiFi conectado");
}

void conectarWebSocketOnce() {
  if (client.connect(ws_host, ws_port, "/")) {
    Serial.println("Conectado ao servidor WebSocket");
    wsConnected = true;
    wsShouldReconnect = false;
  } else {
    Serial.println("Falha na conexão WebSocket inicial");
    wsConnected = false;
    wsShouldReconnect = true;
    lastWsReconnectAttempt = millis();
  }
}

void conectarWebSocket() {
  client.onEvent([](WebsocketsEvent event, String data){
    if (event == WebsocketsEvent::ConnectionOpened) {
      Serial.println("WebSocket conectado (event)");
      wsConnected = true;
      wsShouldReconnect = false;
    } 
    else if (event == WebsocketsEvent::ConnectionClosed) {
      Serial.println("Conexão WebSocket encerrada (event)");
      wsConnected = false;
      wsShouldReconnect = true;
      lastWsReconnectAttempt = millis();
    } 
    else if (event == WebsocketsEvent::GotPing) {
      Serial.println("Ping recebido");
    } 
    else if (event == WebsocketsEvent::GotPong) {
      Serial.println("Pong recebido");
    }
  });

  conectarWebSocketOnce();
}

void ligarCamera() {
  if (esp_camera_init(&config) != ESP_OK) {
    Serial.println("Falha na inicialização da câmera");
    return;
  }
  sensor_t *s = esp_camera_sensor_get();
  if (s) {
    s->set_brightness(s, 1);
    s->set_contrast(s, 1);
    s->set_saturation(s, 1);
  }
}

void enviar() {
  if (WiFi.status() != WL_CONNECTED || !wsConnected || !client.available()) return;

  camera_fb_t *fb = esp_camera_fb_get();
  if (!fb || !fb->buf || fb->len == 0) {
    Serial.println("Falha ao capturar imagem");
    if (fb) esp_camera_fb_return(fb);
    vTaskDelay(200 / portTICK_PERIOD_MS);
    return;
  }

  client.sendBinary((const char*)fb->buf, fb->len);
  esp_camera_fb_return(fb);
}

void receber() {
  client.onMessage([](WebsocketsMessage msg){
    Serial.print("Resposta do servidor: ");
    Serial.println(msg.data());
  });
}

// ===== LEITURA ULTRASSÔNICO =====

float lerDistanciaCM() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long duracao = pulseIn(ECHO_PIN, HIGH, 30000); // timeout de 30ms
  if (duracao == 0) return -1; // sem leitura válida
  float distancia = duracao * 0.0343 / 2.0;
  return distancia;
}
// =================================

void setup() {
  setCpuFrequencyMhz(80);
  Serial.begin(115200);
  vTaskDelay(1000 / portTICK_PERIOD_MS);

  Serial.println("Iniciando tarefas nos dois núcleos...");

  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);

  ligarCamera();
  conectarWiFi();
  conectarWebSocket();
  receber();

  xTaskCreatePinnedToCore(loopCore0, "Core0Loop", 32000, NULL, 1, &Task1, 0);
  xTaskCreatePinnedToCore(loopCore1, "Core1Loop", 8000, NULL, 0, &Task2, 1);
}

void loop() {
  vTaskDelay(portMAX_DELAY);
}

// ===== Tarefa no Core 0 =====
void loopCore0(void * parameter) {
  while (true) {
    Serial.print("Core 0 rodando -> ");
    Serial.println(xPortGetCoreID());

    if (WiFi.status() == WL_CONNECTED && wsConnected && client.available()) {
      enviar();
    }
    vTaskDelay(500 / portTICK_PERIOD_MS);
  }
}

// ===== Tarefa no Core 1 =====
void loopCore1(void * parameter) {
  while (true) {
    Serial.print("Core 1 rodando -> ");
    Serial.println(xPortGetCoreID());

    client.poll();

    // Leitura do ultrassônico
    
    float distancia = lerDistanciaCM();
    if (distancia > 0) {
      Serial.printf("Distância: %.2f cm\n", distancia);
    } else {
      Serial.println("Sem retorno do sensor");
    }
    

    // Reconexão websocket se necessário
    if (wsShouldReconnect && (millis() - lastWsReconnectAttempt >= wsReconnectIntervalMs)) {
      Serial.println("Tentando reconectar WebSocket...");
      lastWsReconnectAttempt = millis();
      if (client.connect(ws_host, ws_port, "/")) {
        Serial.println("Reconectado com sucesso (task)!");
        wsConnected = true;
        wsShouldReconnect = false;
      } else {
        Serial.println("Reconexão falhou (task)...");
        wsConnected = false;
        wsShouldReconnect = true;
      }
    }

    vTaskDelay(500 / portTICK_PERIOD_MS);
  }
}

