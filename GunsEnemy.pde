
class EnemyFan extends Gun {
  EnemyFan() {
    super(10000); //This is the fire rate
    btimer = 10;
  }
  
  void shoot() {
    //b fire (ability)
    //if ze e kee is held down then do a fire a boolet (if btimer is up)
    if (btimer == 0) {
      fanFireE(0, 5, PI/2); // Direction, bulletcount, cone of fire
      //Start the timer till next bullet can be fired (in frames)
      btimer = fireRate;
    }
    else if (btimer != 0) btimer -= 1;
  }
}

void explode(float posx, float posy, int amount) {
  for (int i = amount; i > 0; i = i-1) {
    engine.add(new ExParticle(3, posx, posy));
  }
}