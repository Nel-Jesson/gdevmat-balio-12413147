public class Walker {
  public PVector position = new PVector();
  public float scale = random(5, 25); // 
  public color c = color(random(255), random(255), random(255)); 

  public Walker(float x, float y) {
    position = new PVector(x, y);
  }


  public void update(PVector target) {
    PVector direction = PVector.sub(target, this.position);
    
    if (direction.mag() > 5) { 
        direction.normalize();
        direction.mult(5);
        this.position.add(direction);
    }
}
  
  public void render() {
    fill(c, random(50, 100));
    noStroke();
    circle(position.x, position.y, scale); 
  }
}
