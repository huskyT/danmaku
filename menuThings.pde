ArrayList<MenuButton> menu;

void transition() {
  //Do the white transition here
  for (int i = tFrames; i > 0; i -= 1) {
    noStroke();
    tint(255,10);
    image(white, width/2, height/2);
    noTint();
  }
  tFrames -= 1;
}

void clearMenu() {
  int i = menu.size()-1;
  while (i >= 0) {
    menu.remove(i);
    i--;
  }
}

//Function that might display a menu button 
class MenuButton{
  String label;
  PVector pos = new PVector(0,0);
  int wx;
  int wy;
  String function;
  int argument;
  
  MenuButton(String _label, int _tall, int _wide, String _function, int _argument, int _ex, int _why) {
    label = _label;
    wx = _wide;
    wy = _tall;
    function = _function;
    argument = _argument;
    pos.x = _ex;
    pos.y = _why;
  }
  
  void show() {
    rectMode(CENTER);
    stroke(0);
    fill(123,70,200);
    if (isHover()==true) {
      fill(255,255,255);
    }
    rect(pos.x, pos.y, wx, wy);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(15);
    text(label, pos.x, pos.y);
  }
  
  void action() {
    print("test");
  }
  
  boolean isHover() {
    if (mouseX < this.pos.x - this.wx/2 + this.wx && this.pos.x - this.wx/2 < mouseX 
    && mouseY < this.pos.y - this.wy/2 + this.wy 
    && this.pos.y-this.wy/2 < mouseY) return true;
    else return false;
  }
  
}

void menuSwitch(int screen) {
  //First remove all the current bootons.
  int i = menu.size()-1;
  while (i >= 0) {
    menu.remove(i);
    i--;
  }
  //Then add the new bootons based on waht the screen value is.
  switch(screen) {
    case(1): //Initial Screen
    menu.add(new MenuButton("This button", 30, 120, "Goto", 2, 200, 200));
    break;
    case(2): //Not quite initial - start menu screen
    menu.add(new MenuButton("This button", 40, 200, "Goto", 2, 50, 50));
    break;
  }
}