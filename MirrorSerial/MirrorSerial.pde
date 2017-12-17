import http.requests.*;

boolean initialized, alarmClosed;
void setup() {
  size(displayWidth, displayHeight, P3D);
  //size(420, 680, P3D);
  initFace();
  initConnection();
  //initDoor( );
  //initAlarmSeq();
  println("SET UP DONE");
}

void draw(){
   background(100);
   readData();
   
  if(showAlarm){
    drawAlarm();
  }
  
  if(showHome){
    drawHomeScreen();
  }
  
  if(showFrameRate){
    fill(#00ff00);
    text(frameRate, 10, 20);
  }
  
  if(doorMove){
    myPort.write('1');
  }
  
}