class TestEnemy extends Enemy {
  Gun gun;
  TestEnemy(int x, int y) {
    super(x, y, jellyfish, 30, 30);
    gun = new Gun(10);
    hp = 5;
    fireRate = 20;
    fireDelay = 60;
    btimer = fireDelay;
    ammo = 2;
  }
  
  void move() {
    gun.pos.x = pos.x;
    gun.pos.y = pos.y;
    
    //if ze e kee is held down then do a fire a boolet (if btimer is up) only if you have ammo
    if (btimer == 0 && ammo > 0) {
      float angletoPlayer = atan((realPlayer.pos.x - pos.x)/(realPlayer.pos.y - pos.y))*(-1);
      gun.fanFireE(angletoPlayer, 2, PI/6); // Direction, bulletcount-1, cone of fire
      //Start the timer till next bullet can be fired (in frames)
      btimer = fireRate;
      ammo-=1; //-1 to ammo
    }
    btimer -= 1;
    
    pos.add(vel);
    
    //Test hitbox with stuff
    int i = 0;
    while (i < engine.size()) {
      GameObject hit = engine.get(i);
      //Test for hit if the object is a bullet
      if (hit instanceof PlayerBullet) {
        if (isColliding(hit)) {
          hp-=1;
          hit.hp -= 3;
        }
      }
      i++;
    }
    alivetime++;
    if (hp < 1) {
      explode(pos.x, pos.y, 5);
    }
  }
  
  void shoot() {
    
  }
}

class EnemyBullet extends Bullet {
  EnemyBullet(float angle, float speed, PImage sprite, int wx, int wy, float xpos, float ypos, int hp) {
    super(angle-(3*PI)/2, speed, sprite, wx, wy, hp);
    pos.x = xpos;
    pos.y = ypos;
  }
}