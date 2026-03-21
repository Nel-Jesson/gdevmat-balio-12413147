Walker[] walkers = new Walker[10]; 

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  windowMove(displayWidth/2 - width/2, displayHeight/2 - height/2);  

  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].position = new PVector(random(-200, 200), random(-200, 200));
    float startSpeed = map(walkers[i].mass, 5, 12, 5, 2); 
    walkers[i].velocity = PVector.random2D().mult(startSpeed);

    walkers[i].mass = random(5, 12);
    walkers[i].scale = walkers[i].mass * 12;

    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);

    walkers[i].velocity = PVector.random2D().mult(random(2, 4));
    walkers[i].gravitationalConstant = 1.5f; 
  }
}

void draw() {
  background(255); 

  for (int i = 0; i < walkers.length; i++) {
    
    for (int j = 0; j < walkers.length; j++) {
      
      if (i != j) {
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(force);
      }
    }
    walkers[i].update();
    walkers[i].render();
  }
}
