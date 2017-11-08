
void setup() {
  size(displayWidth, displayHeight, P3D);
 // initVideo();
  initLeap();
  initMirror();
  showLeap = true;
}

void draw(){
  background(20);

//  if(showVideo){
//    drawOpenCV();
//  }
  if(showLeap){
  drawLeap();
  }
  if(showFrameRate){
    fill(#00ff00);
    text(frameRate, 10, 20);
  }
  
}


