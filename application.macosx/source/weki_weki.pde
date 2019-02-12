import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress netAddress;

final int weki_recv = 6448;
final int weki_send = 12000;
final String addr   = "localhost";


SoundController soundController;


void settings() {
  
  size(500,500);
  
  oscP5 = new OscP5(this, weki_send);
  
  netAddress = new NetAddress(addr, weki_recv);
  
  soundController = new SoundController(this);
  
}


void setup() {
  
  
  
}


void draw() {
  
  background(255);

}


void keyPressed() {
    
  print("Sending.");
    
  OscMessage msg = new OscMessage("/wek/inputs");
    
  msg.add((float) mouseX);
  msg.add((float) mouseY);
    
  oscP5.send(msg, netAddress);
   
} 


void oscEvent(OscMessage oscMessage) {
  
  if (oscMessage.addrPattern().equals("/wek/outputs"))
    
    soundController.update_params(oscMessage);
  
}
