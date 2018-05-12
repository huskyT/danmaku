PImage butt;
PImage butthov;
PImage buttdown;

//is the thing being clicked right now
boolean click;

//is the thing hovered
boolean hover;

void setup() {
  size(160,90);
  background(255);
  butt = loadImage("button/deposit.png");
  butt.resize(width, 0);
  butthov = loadImage("button/deposithover.png");
  butthov.resize(width, 0);
  buttdown = loadImage("button/depositunder.png");
  buttdown.resize(width,0);
}

void draw() {
  if (mouseX < width - 13 && mouseX > 13 && mouseY < height - 20 && mouseY > 20) {
    hover = true;
  }
  tint(255,255);
  if (click == true && hover == true) {
    image(buttdown, 0, 0);
  }
  else if (hover == true) {
    tint(255,25);
    image(butthov, 0, 0);
  }
  else {
    image(butt, 0, 0);
  }
  hover = false;
}

void mousePressed() {
  click = true;
}

void mouseReleased() {
  click = false;
}