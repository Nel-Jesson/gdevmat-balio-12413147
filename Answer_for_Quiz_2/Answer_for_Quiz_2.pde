Walker standardWalker;
Walker biasedWalker;

void setup() {
  size(1280, 720);
  background(255); // Start with a white canvas
  
  // Initialize the two walkers
  standardWalker = new Walker();
  biasedWalker = new Walker();
}

void draw() {
  // Walker 1: Uses the modified 8-directional movement
  standardWalker.render();
  standardWalker.randomWalk();
  
  // Walker 2: Uses the custom biased movement
  biasedWalker.render();
  biasedWalker.randomWalkBiased();
}

class Walker {
  float x, y;

  Walker() {
    // Start them in the middle of the screen
    x = width / 2;
    y = height / 2;
  }

  void render() {
    // Random color and random alpha (50-100) every frame
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100);
    
    fill(r, g, b, a); 
    noStroke();
    circle(x, y, 10); 
  }

  void randomWalk() {
    int choice = int(random(8));
    
    if (choice == 0) x++;        // Right
    else if (choice == 1) x--;   // Left
    else if (choice == 2) y++;   // Down
    else if (choice == 3) y--;   // Up
    else if (choice == 4) { x++; y--; } // Top-Right
    else if (choice == 5) { x--; y--; } // Top-Left
    else if (choice == 6) { x++; y++; } // Bottom-Right
    else if (choice == 7) { x--; y++; } // Bottom-Left
  }

  void randomWalkBiased() {
    float r = random(1); 
    
    if (r < 0.40) {         // 0.0 to 0.40 = 40%
      x++; 
    } else if (r < 0.60) {  // 0.40 to 0.60 = 20%
      x--;
    } else if (r < 0.80) {  // 0.60 to 0.80 = 20%
      y--;
    } else {                // 0.80 to 1.0 = 20%
      y++;
    }
  }
}
