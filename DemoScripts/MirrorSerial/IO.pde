boolean showFrameRate;
int voiceIndex = 0;


void keyPressed(){
  switch(key) {
    case 'f':
      //toggle printing frameRate to screen
      showFrameRate = !showFrameRate;
      break;
  }
}