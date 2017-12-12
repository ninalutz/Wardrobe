import http.requests.*;

void setup() {
  size(displayWidth, displayHeight, P3D);
  initConnection();
  init();
}

void draw(){
   background(100);
  
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
  
}