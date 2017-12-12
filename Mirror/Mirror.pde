import http.requests.*;

void setup() {
  size(displayWidth, displayHeight, P3D);
  initLeap();
  initMirror();
  showLeap = true;
}

void draw(){
   background(100);
   
  if(showLeap){
    drawLeap();
  }
  
  if(showAlarm){
    drawAlarm();
  }
  
  if(!showAlarm){
    drawHomeScreen();
    myPort.write('1');
  }
  
  if(showFrameRate){
    fill(#00ff00);
    text(frameRate, 10, 20);
  }
  
}