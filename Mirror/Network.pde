import processing.net.*; 

Client backend, lights;
Server s;
String input;

void initConnection(){
  backend = new Client(this, "18.111.21.136", 12345);
  s = new Server(this, 12346);
}

void sendServer(String data){
  s.write(data);
}

void receiveData(){
  if (backend.available() > 0) { 
    input = backend.readString(); 
  } 
}

String readClient(){
  String input = "";
  lights = s.available();
  if(lights != null){
    input = lights.readString();
  }
  return input;
}