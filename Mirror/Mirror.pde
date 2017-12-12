import http.requests.*;
boolean initialized;
void setup() {
  size(600, 600, P3D);
  initConnection();

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
  
}