int fireTill;
int fireOf;
int iceTill;
int iceOf;

class Gun extends GameObject {
  int fireRate;
  Gun() {
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
      engine.add(new TinyRed(aoe/bulletCount*z-aoe/2+direction, pos.x, pos.y));
    }
  }
}


class Trickle extends Gun {
  Trickle() {
  }
  
  void shoot(float direction, int bulletCount, float aoe) {
    for (int z=bulletCount; z>=0; z--) {
      engine.add(new TinyRed(aoe/bulletCount*z-aoe/2+direction, pos.x, pos.y));
    }
  }
}