public class Walker {
  public PVector position;
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float scale;
  public float mass;
  public color walkerColor;

 public Walker(float m, float y) {
  this.mass = m;
  this.scale = m * 10; 
  this.position = new PVector(Window.left + 80, y);
  this.velocity = new PVector(0, 0); 
  this.acceleration = new PVector(0, 0);
  this.walkerColor = color(random(255), random(255), random(255));
}

  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass); 
    this.acceleration.add(f);
  }

  public void update() {
  this.velocity.add(this.acceleration);
  if (this.position.x > 0 && this.velocity.mag() < 0.2) {
    this.velocity.mult(0);
  }
  
  this.position.add(this.velocity);
  this.acceleration.mult(0);
}

  public void render() {
    stroke(0);      
    strokeWeight(2);    
    fill(walkerColor); 
    circle(position.x, position.y, scale);
  }
}
