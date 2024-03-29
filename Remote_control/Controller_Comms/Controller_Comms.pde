import processing.serial.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;
import processing.net.*;

Client myClient;
ControlDevice cont;
ControlIO control;

float R_JS_Horizontal;
float R_JS_Vertical;
float L_JS_Horizontal;
float L_JS_Vertical;
boolean A,B,X,Y,RB,LB,Back,Start;


String string ; 
String controllerState;


void setup() {
  size(360, 200);
  
  control = ControlIO.getInstance(this);
  cont = control.getMatchedDevice("ARM_C");
  
   if (cont == null) {
    println("not today chump");
    System.exit(-1);
  }
  
  size(200, 200); 
  
  myClient = new Client(this, "127.0.0.1", 50007); 
  
  
  ////println(Arduino.list());
  //arduino = new Arduino(this, Arduino.list()[2], 57600);
  //arduino.pinMode(10, Arduino.SERVO);
  
}

public void getUserInput(){
 // assign our float value 
 //access the controller.
 R_JS_Horizontal = map(cont.getSlider("R_JS_Horizontal").getValue(), -1, 1, -256, 256);
 R_JS_Vertical = map(cont.getSlider("R_JS_Vertical").getValue(), -1, 1, -256, 256);
 L_JS_Horizontal = map(cont.getSlider("L_JS_Horizontal").getValue(), -1, 1, -256, 256);
 L_JS_Vertical = map(cont.getSlider("L_JS_Vertical").getValue(), -1, 1, -256, 256);
 A = cont.getButton("A").pressed();
 B = cont.getButton("B").pressed();
 Y = cont.getButton("Y").pressed();
 X = cont.getButton("X").pressed();
 RB = cont.getButton("RB").pressed();
 //LB = cont.getButton("LB").pressed(); 
 Start = cont.getButton("Start").pressed(); 
 Back = cont.getButton("Back").pressed(); 
 
 //println(A,B,X,Y,RB,LB,Back,Start);
 //println(R_JS_Horizontal ,R_JS_Vertical ,L_JS_Horizontal ,L_JS_Vertical);

 
}

void draw(){
 getUserInput();
 //string = String.format("%f,%f,%f,%f,%",R_JS_Horizontal ,R_JS_Vertical ,L_JS_Horizontal ,L_JS_Vertical,A,B,X,Y,RB,LB,Back,Start);
 controllerState = String.format("A: %s, B: %s, X: %s, Y: %s, RB: %s, LB: %s, Start: %s, Back: %s, R_JS_Horizontal: %f, R_JS_Vertical: %f, L_JS_Horizontal: %f, L_JS_Vertical: %f",
    String.valueOf(A) ,
    String.valueOf(B),
    String.valueOf(X),
    String.valueOf(Y),
    String.valueOf(RB),
    String.valueOf(LB),
    String.valueOf(Start),
    String.valueOf(Back),
    R_JS_Horizontal,
    R_JS_Vertical,
    L_JS_Horizontal,
    L_JS_Vertical
);

 myClient.write(controllerState); // send whatever you need to send here
 println(controllerState);
 
 //background(thumb,100,255);
 
 //arduino.servoWrite(10, (int)thumb);
}
