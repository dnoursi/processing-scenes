/**
 * Cheating scene
 * by David
 
 stage 0 begin: h standing with nobody
 stage 1 w appears
 pause
 stage 2 w leaves
 stage 3 h shrinks, moves to baseball
 stage 4 m appears, m and h osciallate off screen
 
 Based on the template:
 * Pointillism
 * by Daniel Shiffman. 
 * 
 */

// f ~ full, b ~ background
PImage bimg, himg, wimg, mimg;
int fx, fy, hxsize, hysize, wxsize, wysize, mxsize, mysize;
int hx, hy, wx, wy, mx, my;
int stage;

void setup() {
  fx = 1650;
  fy = 1225;
  size(1650, 1225);
  bimg = loadImage("bground.png");
  background(bimg);

  hxsize = 50;
  hysize = 300;
  himg = loadImage("husband.png");
  hx = 300;
  hy = 400;
  
  wxsize = 100;
  wysize = 300;
  wimg = loadImage("wife.png");
  wx = 1500;
  wy = hy;
  
  mxsize = 100;
  mysize = 300;
  mimg = loadImage("miss.png");
  
  stage = 0;
}

void draw() { 
  if (stage == 0) {
    stage = 1;
    return;
  }
  
  if (stage == 1) {
    if (false) {
      stage = 2;
      return;
    }  
    hx ++;
    wx --;
    image(bimg, 0, 0);
    image(himg, hx, hy);
  }
    
}
