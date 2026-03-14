public class Walker
{
   public PVector position = new PVector();
   public PVector velocity = new PVector();
   public PVector acceleration = new PVector();
   
   public float velocityLimit = 10;
   public float scale = 15;
   
   public Walker()
   {
    this.position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
   }
   
   public void update()
   {
    PVector mouse = new PVector(mouseX - width/2, -(mouseY - height/2));
    PVector direction = PVector.sub(mouse, this.position);
    direction.normalize();
    this.acceleration = direction;
    this.acceleration.mult(0.2);
    
     this.acceleration = PVector.random2D();
     this.velocity.add(this.acceleration);
     this.velocity.limit(velocityLimit);
     this.position.add(this.velocity);
   }
   
   public void render()
   {     
     fill(255);
    noStroke();
    circle(position.x, position.y, scale); 
   }
   
   public void checkEdges()
   {
     if (this.position.x > Window.right)
     {
       this.position.x = Window.left;
     }
     else if (this.position.x < Window.left)
     {
       this.position.x = Window.right;
     }
     
     if (this.position.y > Window.top)
     {
       this.position.y = Window.bottom;
     }
     else if (this.position.y < Window.bottom)
     {
       this.position.y = Window.top;
     }
   }
}
