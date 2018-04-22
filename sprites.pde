PImage psprite, psprite1;
PImage cyanball, pinkball, cyanshap, orangeball, redshap;
PImage iceshard;
PImage abbar, hpbar;
PImage jellyfish;
PImage gamebg;

void loadSprites() {
  psprite = loadImage("aseex/psprite.png"); //Player frame 1
  psprite1 = loadImage("aseex/psprite1.png");
  abbar = loadImage("aseex/abbar.png");
  hpbar = loadImage("aseex/hpbar.png");
  
  orangeball = loadImage("aseex/orangeball.png");
  cyanball = loadImage("aseex/cyanball.png");
  cyanshap = loadImage("aseex/cyanshap.png");
  redshap = loadImage("aseex/redsharp.png");
  pinkball = loadImage("aseex/pinkball.png");
  
  iceshard = loadImage("aseex/playershap.png");
  
  jellyfish = loadImage("aseex/jellyfish.png");
  
  gamebg = loadImage("aseex/gamebg.png");
}