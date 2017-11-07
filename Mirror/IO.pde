boolean showFrameRate;
 int voiceIndex = 0;
void keyPressed(){
  switch(key) {
    case 'f':
      //toggle printing frameRate to screen
      showFrameRate = !showFrameRate;
      break;
      
    case 'v': 
      if (voiceIndex + 1 == TextToSpeech.voices.length){
        voiceIndex = 0;
      }
      else{
        voiceIndex +=1;
      }
      TextToSpeech.say("Test voice " + TextToSpeech.voices[voiceIndex]);
      break;
      
  }
}
