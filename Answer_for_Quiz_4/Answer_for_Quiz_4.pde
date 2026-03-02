class Walker {
  float tx, ty, tSize, tR, tG, tB;

  Walker() {
    // Start each 't' at a different random spot so the paths are unique
    tx = random(1000);
    ty = random(2000);
    tSize = random(3000);
    tR = random(4000);
    tG = random(5000);
    tB = random(6000);
  }

  void render() {
    // 1. Scale/Thickness via Perlin
    float thickness = map(noise(tSize), 0, 1, 5, 150);

    // 2. RGB Colors via Perlin
    float r = map(noise(tR), 0, 1, 0, 255);
    float g = map(noise(tG), 0, 1, 0, 255);
    float b = map(noise(tB), 0, 1, 0, 255);

    fill(r, g, b, 255);
    noStroke();

    // 3. Position via Perlin (The Walk)
    float x = map(noise(tx), 0, 1, 0, width);
    float y = map(noise(ty), 0, 1, 0, height);

    circle(x, y, thickness);

    // 4. Advance time for all variables
    tx += 0.01;
    ty += 0.01;
    tSize += 0.01;
    tR += 0.01;
    tG += 0.01;
    tB += 0.01;
  }
}

// Global Walker
Walker perlinWalker;

void setup() {
  size(1280, 720);
  background(255);
  perlinWalker = new Walker();
}

void draw() {
  perlinWalker.render();
}
