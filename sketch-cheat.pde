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
int temp;
int stage;

// Called once
void setup() {
  fx = 1650;
  fy = 1225;
  size(1650, 1225);
  bimg = loadImage("bground.png");
  bimg.resize(fx, fy);
  background(bimg);

  hxsize = 50;
  hysize = 300;
  himg = loadImage("husband.png");
  himg.resize(hxsize, hysize);
  hx = 300;
  hy = 400;
  
  wxsize = 100;
  wysize = 300;
  wimg = loadImage("wife.png");
  wimg.resize(wxsize, wysize);
  wx = 1500;
  wy = hy;
  
  mxsize = 100;
  mysize = 300;
  mimg = loadImage("miss.png");
  mimg.resize(mxsize, mysize);

  stage = 0;
}

// Called approx 50 times per second
void draw() { 
  if (stage == 4) {
    mx = hx + hxsize + 20;
    my = hy;
    image(mimg, mx, my);
  }
  if (stage == 3) {
    if (fy - hy - hysize < 50){
      stage = 4;
    }
    hx --;
    hy ++;
    hx --;
    hy ++;
    image(bimg, 0, 0);
    image(himg, hx, hy);
  }
  if (stage == 2) {
    if (temp == 100){
      stage = 3;
    }
    temp ++;
  }

  if (stage == 1) {
    if (wx - hx < 50) {
      stage = 2;
      temp = 0;
    }  
    hx ++;
    hx ++;
    wx --;
    wx --;
    image(bimg, 0, 0);
    image(himg, hx, hy);
    image(wimg, wx, wy);
  }
  if (stage == 0) {
    stage = 1;
  }

}
