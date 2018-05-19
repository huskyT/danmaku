class TestEnemy extends Enemy {
Gun gun;
  TestEnemy(int x, int y) {
    super(x, y, jellyfish, 30, 30);
    gun = new Gun();
    hp = 1;
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
      //shoot to player?
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

//-----________________________________________________________________________________________________________________________________________________

class BossOne extends Enemy {
  Gun gun;
  ArrayList<Gun> myguns = new ArrayList<Gun>(5);
  BossOne(int x, int y) {
    super(x, y, boss1, 45, 45);
    gun = new Gun();
    hp = 200;
    fireRate = 20;
    fireDelay = 50;
    btimer = fireDelay;
    ammo = 30;
    
    vel.x = random(-3, 3);
    vel.y = 0.1;
    
    myguns.add(new Trickle());
    myguns.add(new Trickle());
    myguns.add(new Trickle());
    myguns.add(new Trickle());
    myguns.add(new Trickle());
  }
  
  void move() {
    gun.pos.x = pos.x;
    gun.pos.y = pos.y;
    
    if (pos.x<topX || pos.x>botX) vel.x = vel.x*(-1);
    if (pos.y<topY || pos.y>botY) vel.y = vel.y*(-1);
    
    //if ze e kee is held down then ado a fire a boolet (if btimer is up) only if you have ammo
    if (btimer == 0 && ammo > 0) {
      //shoot to player?
      float angletoPlayer = atan2(realPlayer.pos.y-pos.y,realPlayer.pos.x - pos.x)-PI/2;
      gun.fanFireE(angletoPlayer, 5, PI/5); // Direction, bulletcount-1, cone of fire
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
      bexplode(pos.x, pos.y, 21);
    }
  }
  
  void shoot() {
    Gun thisgun = myguns.get(1); //This can represent a thing
    float angletoPlayer = atan2(realPlayer.pos.y-pos.y,realPlayer.pos.x - pos.x)-PI/2;
    //thisgun.shoot(angletoPlayer, 5, PI/5);
  }
}

class EnemyBullet extends Bullet {
  EnemyBullet(float angle, float speed, PImage sprite, int wx, int wy, float xpos, float ypos, int hp) {
    super(angle-(3*PI)/2, speed, sprite, wx, wy, hp);
    pos.x = xpos;
    pos.y = ypos;
  }
}