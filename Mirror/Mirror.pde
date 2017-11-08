
void setup() {
  size(displayWidth, displayHeight, P3D);
  initVideo();
  initLeap();
  initMirror();
}

void draw(){
  background(10);

  if(showVideo){
    drawOpenCV();
  }
  if(showLeap){
  drawLeap();
  }
  if(showFrameRate){
    fill(#00ff00);
    text(frameRate, 10, 20);
  }
  if(showAlarm){
    drawAlarm();
  }

}


