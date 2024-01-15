#include <AccelStepper.h>
#include <Servo.h>

int BR_P = 6;
int BR_D = 7; 
int EE_P = 3;
int EE_D = 4;
int BE_P = 11;
int BE_D = 13;
int ER_P = 9;
int ER_D = 7;
int WE_P = 10;
int WE_D = 12;
int GR_P = 2;

void setup() {
  // attached Stepper motors
  AccelStepper BR = AccelStepper(1, BR_P, BR_D);
  AccelStepper EE = AccelStepper(1, EE_P, EE_D);
  AccelStepper BE = AccelStepper(1, BE_P, BE_D);
  AccelStepper ER = AccelStepper(1, ER_P, ER_D);

  // attach servo motors
  Servo GR;
  myservo.attach(GR_P);

  // attach dc motors (not necessary)


  // Set the maximum speed and acceleration:
  BR.setMaxSpeed(1000);
  BR.setAcceleration(100);

  EE.setMaxSpeed(1000);
  EE.setAcceleration(100);

  BE.setMaxSpeed(1000);
  BE.setAcceleration(100);

  ER.setMaxSpeed(1000);
  ER.setAcceleration(100);


}

void loop() {
  // put your main code here, to run repeatedly:

}
