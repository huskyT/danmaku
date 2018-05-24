PImage psprite, psprite1;
PImage cyanball, pinkball, cyanshap, orangeball, redshap, purpleball, redball;
PImage blackstream;
PImage iceshard;
PImage abbar, hpbar;
PImage jellyfish, enem2, boss1;
PImage gamebg, menubg, longbg;
PImage white;
PImage indicator;

void loadSprites() {
  psprite = loadImage("aseex/psprite.png"); //Player frame 1
  psprite1 = loadImage("aseex/psprite1.png");
  abbar = loadImage("aseex/abbar.png");
  hpbar = loadImage("aseex/hpbar.png");
  
  blackstream = loadImage("aseex/blackstream.png");
  
  orangeball = loadImage("aseex/orangeball.png");
  cyanball = loadImage("aseex/cyanball.png");
  cyanshap = loadImage("aseex/cyanshap.png");
  redshap = loadImage("aseex/redsharp.png");
  pinkball = loadImage("aseex/pinkball.png");
  purpleball = loadImage("aseex/purpleball.png");
  redball = loadImage("aseex/redball.png");
  
  iceshard = loadImage("aseex/cyanshap.png");
  
  jellyfish = loadImage("aseex/jellyfish.png");
  enem2 = loadImage("aseex/enem2.png");
  boss1 = loadImage("aseex/boss1.png");
  
  white = loadImage("aseex/white.png");
  gamebg = loadImage("aseex/gamebg.png");
  menubg = loadImage("aseex/menubg.png");
  longbg = loadImage("aseex/longbg.png");
  scrollHeight = longbg.height;
  
  indicator = loadImage("aseex/redball.png");
  indicator.resize(6,6);
}