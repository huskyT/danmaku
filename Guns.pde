int fireTill;
int fireOf;
int iceTill;
int iceOf;

class Gun extends GameObject {
  int btimer;
  int fireRate;
  Gun(int _fireRate) {
    fireRate = _fireRate;
  }
  
  void fanFire(float direction, int bulletCount, float aoe) {
    for (int z=bulletCount; z>=0; z--) {
      engine.add(new PlayerSnowball(aoe/bulletCount*z-aoe/2+direction, realPlayer.pos.x, realPlayer.pos.y));
    }
  }
  
  void doubleFire(int gap) {
    engine.add(new PlayerIce(0, realPlayer.pos.x+gap/2, realPlayer.pos.y));
    engine.add(new PlayerIce(0, realPlayer.pos.x-gap/2, realPlayer.pos.y));
  }
  
  void fanFireE(float direction, int bulletCount, float aoe) {
    for (int z=bulletCount; z>=0; z--) {
      engine.add(new CyanBall(aoe/bulletCount*z-aoe/2+direction, pos.x, pos.y));
    }
  }
}


class FanIce extends Gun {
  FanIce() {
    super(600); //This is the fire rate
    iceOf = 600;
  }
  
  void shoot() {
    //b fire (ability)
    //if ze e kee is held down then do a fire a boolet (if btimer is up)
    if (xk && btimer == 0) {
      fanFire(0, 36, TWO_PI); // Direction, bulletcount, cone of fire
      //Start the timer till next bullet can be fired (in frames)
      btimer = fireRate;
    }
    else if (btimer != 0) btimer -= 1;
    iceTill = btimer;
  }
}

class FireRed extends Gun {
  FireRed() {
    super(6); //This is the fire rate
    fireOf = 6;
  }
  
  void shoot() {
    //a fire(autoattacks)
    //if x is held down then do a fire a boolet (if btimer is up)
    if (zk && btimer == 0) {
      doubleFire(10); // gap
      //Start the timer till next bullet can be fired (in frames)
      btimer = fireRate;
    }
    else if (btimer != 0) btimer -= 1;
    fireTill = btimer;
  }
}