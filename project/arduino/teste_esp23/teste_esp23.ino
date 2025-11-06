#include "esp_camera.h"
#include <WiFi.h>
#include <ArduinoWebsockets.h>
#include "soc/rtc.h"
#include "esp_heap_caps.h"

TaskHandle_t Task1;  // Tarefa no Core 0
TaskHandle_t Task2;  // Tarefa no Core 1

using namespace websockets;

// ===== CONFIGURAÇÕES DE REDE =====
const char* ssid = "CASA-2.4G";
const char* password = "25122003";
const char* ws_host = "192.168.10.4";
const uint16_t ws_port = 8765;
// =================================

WebsocketsClient client;

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
    delay(250);
    Serial.print(".");
  }
  Serial.println("\nWiFi conectado");
}

void conectarWebSocket() {
  client.onEvent([](WebsocketsEvent event, String data){
    if (event == WebsocketsEvent::ConnectionOpened) {
      Serial.println("✅ WebSocket conectado");
    } 
    else if (event == WebsocketsEvent::ConnectionClosed) {
      Serial.println("⚠️ Conexão WebSocket encerrada, tentando reconectar...");
      // tenta reconectar em background
      while (!client.connect(ws_host, ws_port, "/")) {
        Serial.println("Tentando reconectar...");
        delay(2000);
      }
      Serial.println("Reconectado com sucesso!");
    } 
    else if (event == WebsocketsEvent::GotPing) {
      Serial.println("Ping recebido");
    } 
    else if (event == WebsocketsEvent::GotPong) {
      Serial.println("Pong recebido");
    }
  });

  if (client.connect(ws_host, ws_port, "/")) {
    Serial.println("✅ Conectado ao servidor WebSocket");
  } else {
    Serial.println("❌ Falha na conexão WebSocket inicial");
  }
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
  // Captura imagem
  camera_fb_t *fb = esp_camera_fb_get();
  if (!fb || !fb->buf || fb->len == 0) {
    Serial.println("Falha ao capturar imagem ou buffer inválido");
    if (fb) esp_camera_fb_return(fb);
    delay(200);
    return;
  }

  client.sendBinary((const char*)fb->buf, fb->len);
  esp_camera_fb_return(fb);
}

void receber() {
  client.onMessage([](WebsocketsMessage msg){
    String respostaServidor = msg.data();
    Serial.print("Resposta do servidor: ");
    Serial.print(respostaServidor);
    Serial.print(" ===============================================\n");
  });
}

void getMemory() {
  Serial.printf(
    "DRAM livre: %.2f KB - PSRAM livre: %.2f KB - Heap livre: %.2f KB\n",
    heap_caps_get_free_size(MALLOC_CAP_8BIT) / 1024.0,
    heap_caps_get_free_size(MALLOC_CAP_SPIRAM) / 1024.0,
    esp_get_free_heap_size() / 1024.0
  );
}

void setup() {
  setCpuFrequencyMhz(80);
  Serial.begin(115200);
  delay(1000);

  Serial.println("Iniciando tarefas nos dois núcleos...");

  ligarCamera();
  conectarWiFi();
  conectarWebSocket();

  // Cria uma tarefa no Core 0
  xTaskCreatePinnedToCore(
    loopCore0,     // Função da tarefa
    "Core0Loop",   // Nome da tarefa
    10000,         // Tamanho da stack
    NULL,          // Parâmetro
    1,             // Prioridade
    &Task1,        // Handle da tarefa
    0              // Núcleo 0
  );

  // Cria uma tarefa no Core 1
  xTaskCreatePinnedToCore(
    loopCore1,     // Função da tarefa
    "Core1Loop",   // Nome da tarefa
    10000,
    NULL,
    1,
    &Task2,
    1              // Núcleo 1
  );
}

void loop() {
  // O loop principal pode ficar vazio ou fazer algo simples
  getMemory();
  delay(5000);
}

// ===== Tarefa no Core 0 =====
// TIRAR FOTO
void loopCore0(void * parameter) {
  while (true) {
    Serial.print("Core 0 rodando -> ");
    Serial.println(xPortGetCoreID());
    enviar();
    delay(500);  // Espera 1 segundo
  }
}

// ===== Tarefa no Core 1 =====
// RECEBER RESULTADO
void loopCore1(void * parameter) {
  while (true) {
    Serial.print("Core 1 rodando -> ");
    Serial.println(xPortGetCoreID());
    delay(1000);  // Espera 0.5s
  }
}
