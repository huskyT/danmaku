int scrollHeight;
int currentScroll = 0;

void playScreen() {
  //Redraw background
  background(255,255,0);
  imageMode(CORNER);
  
  scrollHeight = longbg.height;
  
  image(longbg, topX, botY-scrollHeight+currentScroll);
  image(longbg, topX, botY-scrollHeight+currentScroll-scrollHeight);
  currentScroll+=10;
  if (currentScroll>scrollHeight) {
    currentScroll = 0;
  }
  
  imageMode(CENTER);
  
  defaultDraw();
  //rect(centX, centY, wid, hei);
  
  //Do a thing with every game object
  int i = engine.size()-1;
  while (i >= 0) {
    GameObject obj = engine.get(i); //This can represent a thing
    obj.show();
    obj.move();
    if (obj.isDead()) {
      engine.remove(i);
    }
    i--;
  }
  
  //if(frameCount%600==0) engine.add(new BossOne(int(random(topX, botX)), topY));
  
  //The overlay menu ish thing
  image(bg, width/2, height/2);
  
  displayFire();
}

void menuScreen() {
  background(menubg);
  int z = menu.size()-1;
  while (z >= 0) {
    MenuButton obj = menu.get(z); //This can represent a thing
    obj.show();
    z--;
  }
}

void resetGame() {
  int i = engine.size()-1;
  while (i >= 0) {
    engine.remove(i);
    i--;
  }
  realPlayer.hp = realPlayer.maxhp;
  engine.add(realPlayer);
  playerisdead = false;
  
  realPlayer.pos.x = centX;
  realPlayer.pos.y = 300;
  realPlayer.iframes = 60;
}