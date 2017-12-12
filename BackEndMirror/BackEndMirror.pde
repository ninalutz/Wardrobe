boolean testVideo, testOpenCV, showFrameRate, showLeap;

//Sending alarm signal 

void setup(){
    size(640, 480);
    initServer();
    initVideo();
    initLeap();
    initDemo();
}


void draw(){
    initDemo();
    if(testVideo){
        testVideoFunc();
    } 
    
    if(testOpenCV){
        testOpenCVFunc();
    } 
    
    if(showFrameRate){
        fill(255, 0, 0);
        text(frameRate, 50, 50);
    }
      
    if(showLeap){
        drawLeap();
    }
 
}