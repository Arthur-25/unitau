void setup() {
  Serial.begin(115200);
  pinMode(2, OUTPUT);
}

void loop() {
  if (Serial.available()) {
        String comando = Serial.readStringUntil('\n');
        if (comando == "deep_sleep") {
            Serial.println("Entrando em Deep Sleep...");
            esp_deep_sleep_start();
        }
  }

  digitalWrite(2, HIGH);  // Acende o LED
  delay(1000);             // Espera 1 segundo
  digitalWrite(2, LOW);   // Apaga o LED
  delay(1000);             // Espera 1 segundo
}
