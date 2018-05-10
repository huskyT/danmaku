import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class buttontest extends PApplet {

PImage butt;
PImage butthov;
PImage buttdown;

//is the thing being clicked right now
boolean click;

//is the thing hovered
boolean hover;

public void setup() {
  
  background(255);
  butt = loadImage("button/deposit.png");
  butt.resize(width, 0);
  butthov = loadImage("button/deposithover.png");
  butthov.resize(width, 0);
  buttdown = loadImage("button/depositunder.png");
  buttdown.resize(width,0);
}

public void draw() {
  if (mouseX < width - 13 && mouseX > 13 && mouseY < height - 20 && mouseY > 20) {
    hover = true;
  }
  tint(255,255);
  if (click == true && hover == true) {
    image(buttdown, 0, 0);
  }
  else if (hover == true) {
    tint(255,25);
    image(butthov, 0, 0);
  }
  else {
    image(butt, 0, 0);
  }
  hover = false;
}

public void mousePressed() {
  click = true;
}

public void mouseReleased() {
  click = false;
}
  public void settings() {  size(160,90); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "buttontest" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
