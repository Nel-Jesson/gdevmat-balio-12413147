int frameCounter = 0;

void setup() {
  size(1280, 720);
  background(255); // Initial white canvas
}

void draw() {
  // 1. GAUSSIAN X-COORDINATE
  float xStandardDeviation = 60;
  float xMean = width / 2;
  float x = (randomGaussian() * xStandardDeviation) + xMean;

  // 2. UNIFORM Y-COORDINATE
  float y = random(0, height);

  // 3. GAUSSIAN SCALE/THICKNESS
  float sizeStandardDeviation = 10;
  float sizeMean = 20;
  float thickness = (randomGaussian() * sizeStandardDeviation) + sizeMean;

  // 4. RANDOM COLORS
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);

  // RENDERING
  noStroke();
  fill(r, g, b, a);
  circle(x, y, thickness);

  frameCounter++;
  if (frameCounter >= 300) {
    background(255); // Clears the paint
    frameCounter = 0; // Resets the timer
  }
}
