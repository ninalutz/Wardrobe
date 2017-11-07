boolean showFrameRate;

void keyPressed(){
  switch(key) {
    case 'f':
      //toggle printing frameRate to screen
      showFrameRate = !showFrameRate;
      break;
  }
}
