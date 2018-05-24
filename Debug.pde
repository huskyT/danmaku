void displayCoords() {
  fill(255);
  rectMode(CENTER);
  noStroke();
  rect(596, 15, 66, 15);
  fill(200,125,130);
  textAlign(CENTER);
  textSize(12);
  text(mouseX +", "+ mouseY, 596, 19);
}

void displayFPS() {
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text(int(frameRate) + " FPS", 560, 470);
}

void displayScore() {
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text(finalScore, 527, 80);
  println(finalScore);
}

void displayFire() {
  rectMode(CORNER);
  noStroke();
  fill(255);
  imageMode(CORNER);
  image(abbar, 464, 159);
  rect(465, 160, 130*realPlayer.aleft/realPlayer.atimer, 20);
  image(hpbar, 464, 119);
  rect(465, 120, 130-(130*realPlayer.hp/realPlayer.maxhp), 20);
  rectMode(CENTER);
  imageMode(CENTER);
  if(playerisdead) {
    textAlign(CENTER);
    text("Press R to Restart", 530, 420);
  }
}