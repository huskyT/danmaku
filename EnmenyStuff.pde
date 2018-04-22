class TestEnemy extends Enemy {
  EnemyFan enemyfan;
  TestEnemy(int x, int y) {
    super(x, y, jellyfish, 30, 30);
    enemyfan = new EnemyFan();
  }
  
  void move() {
    enemyfan.shoot();
    enemyfan.pos.x = pos.x;
    enemyfan.pos.y = pos.y;
    
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
}

class EnemyBullet extends Bullet {
  EnemyBullet(float angle, float speed, PImage sprite, int wx, int wy, float xpos, float ypos, int hp) {
    super(angle-(3*PI)/2, speed, sprite, wx, wy, hp);
    pos.x = xpos;
    pos.y = ypos;
  }
}