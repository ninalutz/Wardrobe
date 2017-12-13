import processing.net.*;

Server s; 
Client c;
int data[];



void initServer(){
    s = new Server(this, 12345);  // Start a simple server on a port
}

void sendServer(String data){
  s.write(data);
  println("Sending: ", data);
}