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
// h usband, w ife, m iss
PImage bimg, himg, wimg, mimg;
int fx, fy, hxsize, hysize, wxsize, wysize, mxsize, mysize;
int hx, hy, wx, wy, mx, my;

int temp;
int stage;
int period = 8;

// Called once
void initCoords(){
  hx = 100;
  // 5 from top
  hy = 5;
  wx = fx;
  wy = hy;
  mx = wx;
  // 5 from bottom
  my = fy - mysize - 5;
}
  
void setup() { 
  fx = 1225;
  fy = 600;
  size(1225, 600);
  bimg = loadImage("bground.png");
  bimg.resize(fx, fy);
  background(bimg);

  hxsize = 50;
  hysize = 300;
  himg = loadImage("husband.png");
  himg.resize(hxsize, hysize);
  //hx = 100;
  //hy = 5;
  
  wxsize = 100;
  wysize = 300;
  wimg = loadImage("wife.png");
  wimg.resize(wxsize, wysize);
  //wx = fx;
  //wy = hy;
  
  mxsize = 100;
  mysize = 300;
  mimg = loadImage("miss.png");
  mimg.resize(mxsize, mysize);

  initCoords();
  stage = 0;
}

// Called approx 50 times per second
void draw() {
  
  if (stage == 4) {
    if (temp == period * 20){
      stage = 0;
      temp = 0;
      initCoords();
    }
    
    /////////
    pushMatrix();
    translate(hx, hy);    
    rotate(PI/30 * (floor(temp/period) % 2));
    image(himg, 0, 0);
    popMatrix();

    pushMatrix();
    translate(mx, my);    
    rotate(-PI/30 * (floor(temp/period) % 2));
    image(mimg, 0, 0);
    popMatrix();
    
    
    temp ++;

  }
  
  // h goes down, w leaves, m arrives
  if (stage == 3) {
    if (fy - hy - hysize < 10){
      stage = 4;
      temp = 0;
     
    }
    
    hy ++;
    
    mx --;
    mx --;
    
    wx --;
    wx --;
    
    image(bimg, 0, 0);
    
    image(himg, hx, hy);
    image(wimg, wx, wy);
    image(mimg, mx, my);
  }
  
  // h and w talk (up and down)
  if (stage == 2) {
    
    if (temp == period * 20){
      stage = 3;
    }
    temp ++;
    image(bimg, 0, 0);

    pushMatrix();
    translate(hx, hy + 5 * (floor(temp/period) % 2) );
    image(himg, 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(wx, wy + 5 * (floor((temp+period)/period) % 2) );
    image(wimg, 0, 0);
    popMatrix();
    
    
  }

  // h and w meet
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