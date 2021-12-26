float energy=1;
int orginal_energy=0;
int max_energy=2000;
float moveAmount=50;
float x,y;

void setup() {
  size(1080, 720);
  x=width/2;
  y=height/2;
}

void draw() {
  background(230);
  
  if (mousePressed==true){
    int elapsedTime=millis()-orginal_energy;
    print(elapsedTime,"\n");
    int time=max_energy-elapsedTime;
    energy=(max_energy-time)/100;
    if (energy/10>1){
      energy=0;
    }
  }
  else{
    energy=0;
  }
  
  fill(0,0,0);
  ellipse(x, y, 100,100);
  fill(255,255,255);
  rect(10,10,500,50,8);
  if (mousePressed){
    fill(0,255,0);
    rect(10,10,500*energy/10,50,8);
  }
}

void mousePressed(){
  orginal_energy=millis();
}

void mouseReleased(){
  x+=moveAmount*energy;
}
