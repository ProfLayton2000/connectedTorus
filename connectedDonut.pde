int r1 = 200;
int r2 = 350;
PVector p1 = new PVector(random(r1,r2),random(0));
PVector p2 = new PVector(random(r1,r2),random(2*PI));

//PVector p1 = new PVector(r1,0);
//PVector p2 = new PVector(r1,PI);


ArrayList<PVector> vertices = new ArrayList<PVector>();

void setup(){
  size(1400,800);
  translate(width/2,height/2);
  

  drawBackground();
}

float t = 0.0;
float dt = 0.01;
void draw(){
  if (t >= 1-dt){
    noLoop();
  }
  translate(width/2,height/2);
  
  drawBackground();
  //x = at + (1-t)b
  float nX = p1.x*t + (1-t)*p2.x; //radius
  float nY = p1.y*t + (1-t)*p2.y; //argument
  vertices.add(new PVector(nX*cos(nY),nX*sin(nY)));
  noFill();
  strokeWeight(3);
  beginShape();
  for (PVector v: vertices){
    vertex(v.x,v.y);
  }
  endShape();
  t += dt;
}

void drawBackground(){
  background(0);
  
  strokeWeight(1);
  stroke(100);
  line(0,-height/2,0,height/2);
  line(-width/2,0,width/2,0);
  
  noFill();
  stroke(255);
  ellipse(0,0,2*r2,2*r2);
  ellipse(0,0,2*r1,2*r1);
  
  float x1 = p1.x*cos(p1.y);
  float y1 = p1.x*sin(p1.y);
  float x2 = p2.x*cos(p2.y);
  float y2 = p2.x*sin(p2.y);
  
  fill(255,0,0);
  ellipse(x1,y1,10,10);
  
  fill(0,0,255);
  ellipse(x2,y2,10,10);
  
}