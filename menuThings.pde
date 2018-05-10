ArrayList<MenuButton> menu;

void transition() {
  //Do the white transition here
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
    rect(pos.x, pos.y, wx, wy);
    textMode(CENTER);
    text(label, pos.x, pos.y);
  }
  
  void action() {
    
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
    menu.add(new MenuButton("This button", 40, 200, "Goto", 2, 50, 50));
    break;
    case(2): //Not quite initial - start menu screen
    menu.add(new MenuButton("This button", 40, 200, "Goto", 2, 50, 50));
    break;
  }
}