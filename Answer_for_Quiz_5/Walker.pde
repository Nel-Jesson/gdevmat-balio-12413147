class Walker {
  PVector position;
  PVector velocity;

  Walker() {
    position = new PVector(0, 0);
    velocity = new PVector(8, 5); 
  }

 void render() {
  fill(255, 0, 0); // Bright Red
  stroke(255);     // White outline so it's visible against dark backgrounds
  circle(position.x, position.y, 30);
}

 void moveAndBounce() {
  position.add(velocity);

  // X-Axis Bounce (Left and Right)
  if (position.x + 15 > Window.right) {
    position.x = Window.right - 15;
    velocity.x *= -1;
  } 
  else if (position.x - 15 < Window.left) {
    position.x = Window.left + 15;
    velocity.x *= -1;
  }

  // Y-Axis Bounce (Top and Bottom)
  if (position.y + 15 > Window.top) {
    position.y = Window.top - 15;
    velocity.y *= -1;
  } 
  else if (position.y - 15 < Window.bottom) {
    position.y = Window.bottom + 15;
    velocity.y *= -1;
  }
}
}
