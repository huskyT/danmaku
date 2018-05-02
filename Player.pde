boolean playerisdead;
int blinkstate = 1;

//class of the controllable ship that represents the player etc
class Player extends GameObject {
  FanIce fanIce;
  FireRed fireRed;
  int maxhp = 8;
  int iframes;
  int maxiframes = 40;
  
  Player() {
    pos.x = centX;
    pos.y = 300;
    spd = 3.5;
    fanIce = new FanIce();
    fireRed = new FireRed();
    hp = maxhp;
    iframes = 60;
    wx = 1;
    wy = 1;
  }

  //Render the thing whoo
  void show() {
    if (iframes > 0) {
      //Do a thing where blink every 4 frames somehow with maths
      if (frameCount%6 == 0) {
        blinkstate = blinkstate * (-1);
      }
      if (blinkstate == -1) {
        tint(123, 0, 255, 225);
      }
    }
    imageMode(CENTER);
    if (zk) image(psprite1, pos.x, pos.y);
    else image(psprite, pos.x, pos.y);
    noTint();
    
    if (shiftk){
      fill(255,0,0);
      ellipse(pos.x, pos.y, 3, 3);
    }
  }
  
  //Make sprite move according to current velocity
  void move(){
    //Move the thing
    pos.add(vel);
    
    
    //Make the speeds 0
    vel.x = 0; vel.y = 0;
    //Add speeds if buttons is helddded downs.
    if (downk && pos.y < botY) vel.y += spd;
    if (upk && pos.y > topY) vel.y -= spd;
    if (rightk && pos.x < botX) vel.x += spd;
    if (leftk && pos.x > topX) vel.x -= spd;
    
    fanIce.shoot();
    fireRed.shoot();
    
    //if shif is held then slow the player
    if (shiftk) spd = 2;
    else spd = 3.5;
    
    //Hittest
    int i = 0;
    
    //If you have no iframes, do hitcheck
    while (i < engine.size()) {
      GameObject hit = engine.get(i);
      //Test for hit if the object is a bullet
      if (hit instanceof EnemyBullet) {
        if (isColliding(hit)) {
          if (iframes < 1) {
            hp-=1;
            iframes = maxiframes;
            hit.hp -= 1;
          }
        }
      }
      i++;
    }
    if (hp < 1) {
      explode(pos.x, pos.y, 30);
      playerisdead = true;
    }
    if (iframes > 0) {
      iframes--;
    }
  }
  
  boolean isDead() {
    return (hp<1);
  }
}