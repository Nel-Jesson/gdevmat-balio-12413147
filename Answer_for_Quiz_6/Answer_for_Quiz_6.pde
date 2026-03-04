void setup() {
  size(1280, 720, P3D);
  pixelDensity(1);
}

void draw() {
  background(0); // Black background for a better glow effect
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  PVector mouse = mousePos();
  mouse.normalize().mult(300); 

  // --- 1. RED OUTER GLOW (High thickness) ---
  strokeWeight(30); 
  stroke(255, 0, 0, 150); // Red with alpha for glow
  drawSaber(mouse);

  // --- 2. WHITE INNER GLOW (Low thickness) ---
  strokeWeight(10);
  stroke(255); // White
  drawSaber(mouse);

  // --- 3. BLACK HANDLE (Mid thickness) --- 
  strokeWeight(30); 
  stroke(0);        // Black
  PVector handleDir = mousePos(); 
  handleDir.limit(35); 
  line(-handleDir.x, -handleDir.y, handleDir.x, handleDir.y);
  println("Blade Magnitude: " + mouse.mag());
}

PVector mousePos() {
  float x = mouseX - (width / 2);
  float y = -(mouseY - (height / 2));
  return new PVector(x, y);
}

void drawSaber(PVector v) {
  line(0, 0, v.x, v.y); 
  line(0, 0, -v.x, -v.y); 
}
