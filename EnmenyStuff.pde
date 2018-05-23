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
    vel.add(accel);
    
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
  BossOne(int x, int y) {
    super(x, y, boss1, 45, 45);
    gun = new Gun();
    hp = 200;
    fireRate = 20;
    fireDelay = 50;
    btimer = fireDelay;
    ammo = 0;
    phase = 0;
    phasecount = 7;
    
    vel.x = 0;
    vel.y = 0.1;
  }
  
  void move() {
    gun.pos.x = pos.x;
    gun.pos.y = pos.y;
    
    if (pos.x<topX || pos.x>botX) vel.x = vel.x*(-1);
    if (pos.y<topY || pos.y>botY) vel.y = vel.y*(-1);
    
    
    
    pos.add(vel);
    vel.add(accel);
    shoot();
    
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
    float angletoPlayer = atan2(realPlayer.pos.y-pos.y,realPlayer.pos.x - pos.x)-PI/2;
    //if ze e kee is held down then ado a fire a boolet (if btimer is up) only if you have ammo
    if (btimer == 0) { 
      switch(phase) { //Depending on which phase, shoot a different thing from the gun
        case 1:
          gun.fanFireE(angletoPlayer, 6, PI/3); // Direction, bulletcount-1, cone of fire
          break;
        case 2:
          //Take a break :D
          break;
        case 3:
          gun.tinyFireE(angletoPlayer); // Direction, bulletcount-1, cone of fire
          break;
        case 4:
          //Do nothing!
          break;
        case 5: //Fire which fans off
          gun.fastFireE(-PI/4, ammo, PI/18);
          break;
        case 6: //fan off in other direction now
          gun.fastFireE(PI/4, ammo, -PI/18);
          break;
        case 7:
          //idle
          break;
      }
      //Start the timer till next bullet can be fired (in frames)
      btimer = fireRate;
      ammo-=1; //-1 to ammo
    }
    btimer -= 1;
    if (ammo == 0) { //When ammo reaches zeho...
      phase += 1;
      if (phase > phasecount) phase = 1;
      loadGun(phase);
    }
    println(phase + " this " + ammo);
  }
  
  void loadGun(int phase){
    switch(phase) {
      case 1:
        ammo = 3;
        fireRate = 40;
        break;
      case 2:
        ammo = 1;
        fireRate = 120;
        break;
      case 3:
        ammo = 20;
        fireRate = 12;
        break;
      case 4:
        ammo = 1;
        fireRate = 120;
        break;
      case 5:
        ammo = 12;
        fireRate = 4;
        break;
      case 6:
        ammo = 12;
        fireRate = 4;
        break;
      case 7:
        ammo = 1;
        fireRate = 120;
    }
  }
}

class EnemyBullet extends Bullet {
  EnemyBullet(float angle, float speed, PImage sprite, int wx, int wy, float xpos, float ypos, int hp) {
    super(angle-(3*PI)/2, speed, sprite, wx, wy, hp);
    pos.x = xpos;
    pos.y = ypos;
  }
}