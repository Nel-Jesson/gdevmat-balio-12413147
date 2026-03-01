float amplitude = 50.0; 
float frequency = 0.05;
float phase = 0.0; 

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(150); 
  translate(width/2, height/2); // Centers the axes
  
  // Draw the black axes
  stroke(0);
  line(-width/2, 0, width/2, 0); 
  line(0, -height/2, 0, height/2);

  // 1. Circle in the Middle (White)
  stroke(255); 
  strokeWeight(3);
  noFill();
  ellipse(0, 0, 100, 100);

  // 2. (Yellow): f(x) = x^2 - 15x - 3
  stroke(255, 255, 0); 
  strokeWeight(2);
  noFill();
  beginShape();
  for (float x = -width/2; x < width/2; x++) {
    float y = pow(x, 2) - (15 * x) - 3;
    vertex(x, -y * 0.01); 
  }
  endShape();

 // 3.(Purple): f(x) = -5x + 30
  stroke(128, 0, 128); 
  beginShape();
  for (float x = -width/2; x < width/2; x++) {
    float sx = x * 0.1;
    float y = (-5 * sx) + 30; 
    vertex(x, -y * 5); 
  }
  endShape();

  // 4. Sine Wave (Blue)
  stroke(0, 0, 255);
  strokeWeight(4);
  beginShape();
  for (float x = -width/2; x < width/2; x++) {
    float y = amplitude * sin((x * frequency) + phase); //
    vertex(x, -y);
  }
  endShape();

  phase += 0.05; 
}

void keyPressed() {
  if (key == 'w') amplitude += 5;
  if (key == 's') amplitude -= 5;
  if (key == 'd') frequency += 0.01; 
  if (key == 'a') frequency -= 0.01; 
}
