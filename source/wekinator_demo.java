import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class wekinator_demo extends PApplet {




OscP5 oscP5;
NetAddress netAddress;

final int port = 6448;
final String addr = "localhost"; //"127.0.0.1";


public void setup() {
  
  
  
  oscP5 = new OscP5(this, 12345);
  
  netAddress = new NetAddress(addr, port);
  
  
}


public void draw() {
  
  
}


public void keyPressed() {
    
  // isSending = !isSending;
  
  // if (isSending) {
    
    print("Sending.");
    
    OscMessage msg = new OscMessage("/wek/inputs");
    
    msg.add((float) mouseX);
    msg.add((float) mouseY);
    
    oscP5.send(msg, netAddress);
    
  // }

  

  
  
  
} 
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "wekinator_demo" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
