Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup() {
  size(1280, 720, P3D);
  windowMove(displayWidth/2 - width/2, displayHeight/2 - height/2); 
  
  for (int i = 0; i < walkers.length; i++) {
    float m = random(1, 10); 
    walkers[i] = new Walker(m);
  }
}

void draw() {
  background(80); 
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
    
    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }
}
