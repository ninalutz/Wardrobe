import processing.io.*;
SoftwareServo servo;

void initDoor(){
    servo = new SoftwareServo(this);
    servo.attach(4);
  // On the Raspberry Pi, GPIO 4 is pin 7 on the pin header,
  // located on the fourth row, above one of the ground pins
}

void moveDoorLeft(float steps, int speed){
    float angle = 90*steps;
    servo.write(angle);
    delay(speed);
}

void moveDoorRight(float steps, int speed){
    float angle = 90*steps;
    servo.write(angle); 
    delay(speed);
}

void setup(){
  initDoor();
  size(200, 200);
}

void draw(){
  moveDoorRight(1, 1);
  moveDoorLeft(1, 2);
  noLoop();
}