class Walker {
  float x, y;

  Walker() {
    x = width / 2;
    y = height / 2;
  }

  void render() {
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
    if (choice == 0) x++;        
    else if (choice == 1) x--;   
    else if (choice == 2) y++;   
    else if (choice == 3) y--;   
    else if (choice == 4) { x++; y--; } 
    else if (choice == 5) { x--; y--; } 
    else if (choice == 6) { x++; y++; } 
    else if (choice == 7) { x--; y++; } 
  }

  void randomWalkBiased() {
    float r = random(1); 
    if (r < 0.40) {       // 40% chance for Right
      x++; 
    } else if (r < 0.60) { // 20% Left
      x--;
    } else if (r < 0.80) { // 20% Up
      y--;
    } else {               // 20% Down
      y++;
    }
  }
}
