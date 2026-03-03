void setup() {
  size(1280, 720, P3D);
  pixelDensity(1); // Force standard scaling to fix window issues
  // Which ironcially was my main issue when doing this
}

Walker myWalker = new Walker();
 
void draw() {
  background(50); 
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  myWalker.moveAndBounce();
  myWalker.render();
}
