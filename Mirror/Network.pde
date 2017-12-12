import processing.net.*; 

Client backend, lights;
Server s;
String input;
String[] data;
void initConnection(){
  backend = new Client(this, "18.111.21.136", 12345);
}


void readData(){
  if (backend.available() > 0) { 
    input = backend.readString(); 
    data = split(input, ',');  // Split values into an array
  }
  
  //initialize alarm sequence
  if(data != null && data[0].equals("Alarm") && !initialized){
    initAlarm();
    initialized = true;
  }
  
  println(input, initialized);
}