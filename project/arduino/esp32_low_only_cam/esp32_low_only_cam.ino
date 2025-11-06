#include "esp_camera.h"
#include <WiFi.h>
#include <ArduinoWebsockets.h>
#include "soc/rtc.h"

using namespace websockets;

// ===== CONFIGURAÇÕES DE REDE =====
const char* ssid = "CASA-2.4G";
const char* password = "25122003";
const char* ws_host = "192.168.10.4";
const uint16_t ws_port = 8765;
// =================================

WebsocketsClient client;
volatile bool respostaRecebida = false;
String respostaServidor;

// ===== CONFIGURAÇÃO DA CÂMERA =====
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
// =================================
=
// Intervalo entre envios em ms (≈3 fps)
const unsigned long intervaloEnvio = 333;

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
  if (client.connect(ws_host, ws_port, "/")) {
    Serial.println("Conectado ao servidor WebSocket");
  } else {
    Serial.println("Falha na conexão WebSocket");
  }
}

// ===== Setup =====
void setup() {
  setCpuFrequencyMhz(80);
  Serial.begin(115200);
  Serial.setDebugOutput(false);

  // Inicializa câmera
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

  conectarWiFi();
  conectarWebSocket();

  client.onMessage([](WebsocketsMessage msg){
    respostaServidor = msg.data();
    respostaRecebida = true;
  });
}

// ===== Loop =====
void loop() {
  static unsigned long ultimoEnvio = 0;
  client.poll();

  if (millis() - ultimoEnvio >= intervaloEnvio) {
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
    ultimoEnvio = millis();

    // Espera resposta do servidor
    respostaRecebida = false;
    unsigned long tempoLimite = millis() + 3000;
    while (!respostaRecebida && millis() < tempoLimite) {
      client.poll();
      delay(1);
    }

    if (respostaRecebida) {
      Serial.print("Resposta do servidor: ");
      Serial.println(respostaServidor);
    } else {
      Serial.println("Sem resposta do servidor");
    }
  }
}
