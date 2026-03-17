Walker[] walkers = new Walker[8];

void setup() {
  size(1280, 720, P3D);
  windowMove(displayWidth/2 - width/2, displayHeight/2 - height/2); 
  initWalkers();
}

void initWalkers() {
  float currentY = Window.top - 40; 
  
  for (int i = 0; i < walkers.length; i++) {
    float m = i + 1;
    float currentScale = m * 15;
    walkers[i] = new Walker(m, currentY - (currentScale / 2));
    
    currentY -= (currentScale + 20); 
  }
}

void mousePressed() {
  initWalkers(); 
}

void draw() {
  background(255); 
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  line(0, Window.top, 0, Window.bottom); 

  for (int i = 0; i < walkers.length; i++) {
    PVector push = new PVector(0.18, 0);
    walkers[i].applyForce(push);
    float baseMew = (walkers[i].position.x > 0) ? 0.18f : 0.01f;
    float frictionMag = baseMew / (walkers[i].mass * 0.5f); 

    if (walkers[i].velocity.mag() > 0.05) {
        PVector friction = walkers[i].velocity.copy();
        friction.normalize();
        friction.mult(-1);
        friction.mult(frictionMag * walkers[i].mass); 
        walkers[i].applyForce(friction);
    } else if (walkers[i].position.x > 0) {
        walkers[i].velocity.mult(0); 
    }

    walkers[i].update();
    walkers[i].render();
  }
}
