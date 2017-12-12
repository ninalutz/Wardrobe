

void keyPressed(){
  switch(key){
    case 'v':
        testVideo = !testVideo;
        break;
    case 'o':
        testOpenCV = !testOpenCV;
        break;
    case 'f':
        showFrameRate = !showFrameRate;
        break;
  }
}