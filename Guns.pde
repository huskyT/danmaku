int fireTill;
int fireOf;
int iceTill;
int iceOf;

class Gun extends GameObject {
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
      engine.add(new TinyBall(aoe/bulletCount*z-aoe/2+direction, pos.x, pos.y));
    }
  }
}


class FanIce extends Gun {
  FanIce() {
    super(600); //This is the fire rate
    iceOf = 600;
  }
  
  void shoot() {
    fanFire(0, 35, TWO_PI); // Direction, bulletcount, cone of fire
  }
}

class FireRed extends Gun {
  FireRed() {
    super(6); //This is the fire rate
    fireOf = 6;
  }
  
  void shoot() {
    //a fire(autoattacks)
    doubleFire(8);
  }
}