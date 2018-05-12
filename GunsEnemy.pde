
class EnemyFan extends Gun {
  EnemyFan() {
    super(-1); //This is the fire rate
  }
  
  void shoot() {
    //b fire (ability)
    float angletoPlayer = atan((realPlayer.pos.x - pos.x)/(realPlayer.pos.y - pos.y))*(-1);
    fanFireE(angletoPlayer, 2, PI/6); // Direction, bulletcount-1, cone of fire
  }
}

void explode(float posx, float posy, int amount) {
  for (int i = amount; i > 0; i = i-1) {
    engine.add(new ExParticle(3, posx, posy));
  }
}