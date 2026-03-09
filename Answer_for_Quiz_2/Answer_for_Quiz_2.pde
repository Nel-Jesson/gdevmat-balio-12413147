Walker standardWalker;
Walker biasedWalker;

void setup() {
  size(1280, 720);
  background(255); 
  
  standardWalker = new Walker();
  biasedWalker = new Walker();
}

void draw() {
  standardWalker.render();
  standardWalker.randomWalk();
  
  biasedWalker.render();
  biasedWalker.randomWalkBiased();
}
