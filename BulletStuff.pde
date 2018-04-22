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
    super(angle, 10, redshap, 9, 25, xpos, ypos, 1);
  }
}

class PlayerSnowball extends PlayerBullet {
  PlayerSnowball(float angle, float xpos, float ypos) {
    super(angle, 10, iceshard, 32, 35, xpos, ypos, 5);
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

class CyanBall extends EnemyBullet {
  CyanBall(float angle, float xpos, float ypos) {
    super(angle, 2, pinkball, 20, 20, xpos, ypos, 1);
  }
}