const int pulPin = 6;
const int dirPin = 9;
void setup() {
    pinMode(pulPin, OUTPUT);
    pinMode(dirPin, OUTPUT);
    digitalWrite(dirPin,LOW);
}

void loop() {
    digitalWrite(pulPin, HIGH);
    delayMicroseconds(50);
    digitalWrite(pulPin, LOW);
    delayMicroseconds(50);
}
