boolean showFrameRate;
int voiceIndex = 0;

import processing.serial.*;
Serial myPort;  // Create object from Serial class

void keyPressed(){
  switch(key) {
    case 'f':
      //toggle printing frameRate to screen
      showFrameRate = !showFrameRate;
      break;
  }
}