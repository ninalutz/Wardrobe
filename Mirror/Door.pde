import processing.io.*;
SoftwareServo servo;

void initDoor(){
    servo = new SoftwareServo(this);
    servo.attach(4);
  // On the Raspberry Pi, GPIO 4 is pin 7 on the pin header,
  // located on the fourth row, above one of the ground pins
}

void moveDoor(String pos){
  //based on position do the left or right motion
}

void moveDoorLeft(int steps, int speed){
    float angle = -360*steps;
    servo.write(angle);
    delay(speed);
}

void moveDoorRight(int steps, int speed){
    float angle = 360*steps;
    servo.write(angle); 
    delay(speed);
}