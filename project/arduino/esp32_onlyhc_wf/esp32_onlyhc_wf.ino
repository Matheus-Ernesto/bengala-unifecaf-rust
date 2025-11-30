#include <WiFi.h>
#include <WebServer.h>

// ==== CONFIG WIFI AP ====
const char* ssid     = "ESP32CAM_HCSR04";
const char* password = "12345678";

// ==== PINAGEM ESP32-CAM ====
#define TRIG_PIN 12
#define ECHO_PIN 13
#define FLASH_PIN 4  // LED flash

// ==== SERVIDOR WEB ====
WebServer server(80);

// ==== ARMAZENAR ÚLTIMOS 5 REGISTROS ====
float registros[5] = {0, 0, 0, 0, 0};
int indexReg = 0;
bool bufferCheio = false;


// ==== FUNÇÃO DE LEITURA DO HC-SR04 ====
float lerDistancia() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long duracao = pulseIn(ECHO_PIN, HIGH, 30000); // timeout 30ms
  float distancia = duracao * 0.034 / 2; // cm

  if (distancia <= 0 || distancia > 400) distancia = -1; // inválida
  return distancia;
}


// ==== SALVAR NO BUFFER CIRCULAR ====
void salvarRegistro(float valor) {
  registros[indexReg] = valor;
  indexReg++;

  if (indexReg >= 5) {
    indexReg = 0;
    bufferCheio = true;
  }
}


// ==== MÉDIA DOS ÚLTIMOS 5 ====
float mediaRegistros() {
  float soma = 0;
  int total = bufferCheio ? 5 : indexReg;

  if (total == 0) return 0;

  for (int i = 0; i < total; i++) {
    soma += registros[i];
  }
  return soma / total;
}


// ==== PÁGINA WEB ====
void handleRoot() {
  String page = "<!DOCTYPE html><html><head>"
                "<meta charset='UTF-8'>"
                "<title>ESP32 HC-SR04</title>"
                "<style>"
                "body{font-family:Arial;background:#111;color:white;padding:20px;}"
                "h1{color:#4CAF50;}"
                "table{border-collapse:collapse;width:300px;}"
                "td,th{border:1px solid #555;padding:8px;text-align:center;}"
                "</style></head><body>";

  page += "<h1>Monitor HC-SR04</h1>";

  float media = mediaRegistros();

  page += "<p><b>Média dos últimos registros:</b> ";
  page += String(media, 2) + " cm</p>";

  page += "<h2>Últimos 5 registros:</h2>";
  page += "<table><tr><th>#</th><th>Distância (cm)</th></tr>";

  int total = bufferCheio ? 5 : indexReg;
  for (int i = 0; i < total; i++) {
    page += "<tr><td>" + String(i+1) + "</td><td>" + String(registros[i], 2) + "</td></tr>";
  }
  page += "</table>";

  page += "</body></html>";

  server.send(200, "text/html", page);
}


// ==== SETUP ====
void setup() {
  Serial.begin(115200);

  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(FLASH_PIN, OUTPUT);
  digitalWrite(FLASH_PIN, LOW);

  // Criar hotspot
  WiFi.softAP(ssid, password);
  Serial.println("Hotspot criado!");
  Serial.print("IP: ");
  Serial.println(WiFi.softAPIP());

  server.on("/", handleRoot);
  server.begin();
}


// ==== LOOP ====
void loop() {
  server.handleClient();

  float distancia = lerDistancia();
  if (distancia != -1) {
    salvarRegistro(distancia);
    Serial.print("Distancia: ");
    Serial.print(distancia);
    Serial.println(" cm");

    // Aciona flash entre 0 e 100cm
    if (distancia > 0 && distancia <= 100) {
      digitalWrite(FLASH_PIN, HIGH);
    } else {
      digitalWrite(FLASH_PIN, LOW);
    }
  }

  delay(700); // evita spam e dá tempo ao sensor
}
