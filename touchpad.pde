import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress netAddress;

final int port = 6448;
final String addr = "localhost"; //"127.0.0.1";


void setup() {
  
  size(500,500);
  
  oscP5 = new OscP5(this, 12345);
  
  netAddress = new NetAddress(addr, port);
  
  
}


void draw() {
  
  
}


void keyPressed() {
    
  // isSending = !isSending;
  
  // if (isSending) {
    
    print("Sending.");
    
    OscMessage msg = new OscMessage("/wek/inputs");
    
    msg.add((float) mouseX);
    msg.add((float) mouseY);
    
    oscP5.send(msg, netAddress);
    
  // }

  

  
  
  
} 
