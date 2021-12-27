float energy=1;
int orginal_energy=0;
int max_energy=2000;
float moveAmount=10;
float x,y,vel,accel;
int positive;
PVector pos, dir;
final float degree = 0.0174532;
float angle=0;

void setup() {
  size(1080, 720);
  x=width/2;
  y=height/2;
  
  pos = new PVector(width/2, height/2);
  dir = new PVector(0, -10);
}

void draw() {
  background(230);
  
  if (mousePressed==true){
    int elapsedTime=millis()-orginal_energy;
    int time=max_energy-elapsedTime;
    energy=(max_energy-time)/100;
    if (energy/10>1){
      energy=0;
    }
  }
  else{
    energy=0;
  }
  
  changeLoc();
  
  fill(0,0,0);            //Main character
  ellipse(x, y, 100,100); //Main Character
  
  fill(255,255,255);      //Energy Bar
  rect(10,10,500,50,8);   //Energy Bar
  
  if (mousePressed){
    fill(0,255,0);                    //Energy Bar amount full    
    rect(10,10,500*energy/10.0,50,8); //Energy Bar amount full
  }
  
  PVector oldPos;
  fill(255,0,255);
  translate(pos.x, pos.y);
  oldPos = new PVector(pos.x,pos.y);
  print(oldPos);
  dir.rotate(degree*1);
  angle=atan2(dir.y, dir.x);
  rotate(angle);
  triangle(-10, -15, -10, 15, 20, 0);
  rotate(atan2(-dir.y,-dir.x));
  translate(-oldPos.x,-oldPos.y);
  
}

void mousePressed(){
  orginal_energy=millis();
}

void mouseReleased(){
  vel=moveAmount*energy;
}

void changeLoc(){
  
  if (vel==0){
    positive=0;
  }
  else if (vel>0){
    positive=-1;
  }
  else{
    positive=1;
  }
  
  vel+=positive;
  
  if (vel<0 && positive==-1){
    vel=0;
  }
  else if (vel>0 && positive==1){
    vel=0;
    print("YO");
  }
  if (x>=width || x<=0){
    vel*=-1;
  }
  
  x-=sin(angle)*vel;
  y+=cos(angle)*vel;
}

void keyPressed() {
  if (keyCode == UP) { pos.add(dir);}
  if (keyCode == DOWN) { pos.sub(dir);}
}

/**int oTo1(int num){
  if (num==0){
    print("WASS UP"+random(0,10)+"n");
    return -9;
  } else{
    return 1;
  }
}**/
