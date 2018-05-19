//Stuff the player will shoote
class PlayerBullet extends Bullet {

  //Constructor
  PlayerBullet(float angle, float speed, PImage sprite, int wx, int wy, float xpos, float ypos, int hp) {
    super(angle-PI/2, speed, sprite, wx, wy, hp);
    //Create the bullet at player location
    pos.x = xpos;
    pos.y = ypos;
    
  }
}

class PlayerIce extends PlayerBullet {
  PlayerIce(float angle, float xpos, float ypos) {
    super(angle, 10, blackstream, 32, 41, xpos, ypos, 1);
  }
}

class PlayerSnowball extends PlayerBullet {
  PlayerSnowball(float angle, float xpos, float ypos) {
    super(angle, 10, iceshard, 8, 40, xpos, ypos, 5);
  }
  
  void move() { 
    pos.add(vel);
    vel.add(accel);
    
    int i = 0;
    while (i < engine.size()) {
      GameObject hit = engine.get(i);
      //Test for hit if the object is a bullet
      if (hit instanceof EnemyBullet) {
        if (isColliding(hit)) {
          hit.hp -= 1;
        }
      }
      i++;
    }
  }
}

class TinyRed extends EnemyBullet {
  TinyRed(float angle, float xpos, float ypos) {
    super(angle, 2, redshap, 10, 20, xpos, ypos, 1);
  }
}

class TinyBall extends EnemyBullet {
  TinyBall(float angle, float xpos, float ypos) {
    super(angle, 2, redball, 15, 15, xpos, ypos, 1);
  }
}