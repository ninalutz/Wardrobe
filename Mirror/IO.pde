boolean showFrameRate, showLeap, showVideo;
int voiceIndex = 0;

import processing.serial.*;

Serial myPort;  // Create object from Serial class

void keyPressed(){
  switch(key) {
    case 'f':
      //toggle printing frameRate to screen
      showFrameRate = !showFrameRate;
      break;
    case 'v':
      showVideo = !showVideo;
      break;
    case 'l':
      showLeap = !showLeap;
      break;
  }
}


