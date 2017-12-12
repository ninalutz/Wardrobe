import http.requests.*;

void setup() {
  size(displayWidth, displayHeight, P3D);
  initMirror();
}

void draw(){
   background(100);
  
  if(showAlarm){
    drawAlarm();
  }
  
  if(!showAlarm){
    drawHomeScreen();
  }
  
  if(showFrameRate){
    fill(#00ff00);
    text(frameRate, 10, 20);
  }
  
}