import processing.io.*;
SoftwareServo servo;

void initDoor(){
    servo = new SoftwareServo(this);
    servo.attach(4);
  // On the Raspberry Pi, GPIO 4 is pin 7 on the pin header,
  // located on the fourth row, above one of the ground pins
}

void moveDoor(){
    //moveDoorLeft(150);
    //delay(3000);
    //moveDoorLeft(30);
    //delay(3000);
  //  myPort.write('1');
}

void moveDoorLeft(int speed){
    servo.write(speed);
}