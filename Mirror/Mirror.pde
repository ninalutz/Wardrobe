void setup() {
  size(displayWidth, displayHeight, P3D);
  background(255);
  initVideo();
  //initLeap();
}

void draw(){
  //background(255);
  //drawVideo();
  //drawLeap();
  drawOpenCV();
  if(showFrameRate){
    fill(#00ff00);
    text(frameRate, 10, 20);
  }
}


