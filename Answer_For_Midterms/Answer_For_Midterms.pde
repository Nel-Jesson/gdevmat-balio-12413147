Walker[] matterList = new Walker[300]; 
PVector blackHole;

void setup() {
  size(1080, 720, P3D);
  windowMove(displayWidth/2 - width/2, displayHeight/2 - height/2); 
  // ^To centralized the window 
  spawnUniverse(); 
  pixelDensity(2);
}

void draw() {
  background(0, 0, 0);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  int swallowedCount = 0;

  for (int i = 0; i < matterList.length; i++) {
    matterList[i].update(blackHole);
    matterList[i].render();

    float distance = PVector.dist(matterList[i].position, blackHole);
    if (distance < 10) {
      swallowedCount++;
    }
  }

  fill(255);
  noStroke();
  circle(blackHole.x, blackHole.y, 50);

  if (swallowedCount > matterList.length * 0.9) {
    spawnUniverse();
  }
}

void spawnUniverse() {
  float x = random(Window.left, Window.right);
  float y = random(Window.bottom, Window.top);
  
  blackHole = new PVector(x, y); 

  for (int i = 0; i < matterList.length; i++) {
    float gx = (float) randomGaussian() * 100;
    float gy = (float) randomGaussian() * 100;
    matterList[i] = new Walker(gx, gy);
  }
}
