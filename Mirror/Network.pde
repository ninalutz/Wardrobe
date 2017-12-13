import processing.net.*; 

Client backend, lights;
Server s;
String input;
String[] data;
void initConnection(){
  backend = new Client(this, "18.111.54.199", 12345);
}


void readData(){
  if (backend.available() > 0) { 
    input = backend.readString(); 
    data = split(input, ',');  // Split values into an array
    println("Received: ", input);
  }
  
  //initialize alarm sequence
  if(data != null && data[0].equals("Alarm") && !initialized){
    initAlarm();
    initialized = true;
    println("initialized");
  }
  
  //turn off alarm at swipe
  if(data != null && data[0].equals("swipe")){
    showAlarm = false;
    showHome = true;
    player.close();
    minim.stop();
    //Say the proper thing from original data stream
    //
  }
  

}