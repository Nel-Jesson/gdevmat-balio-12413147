Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10]; 

void setup() {
   size(1280, 720, P3D);
   camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
   
   for (int i = 0; i < walkers.length; i++) {
     // Spacing them from left to right
     float xPos = map(i, 0, walkers.length - 1, Window.left + 100, Window.right - 100);
     float yPos = 300;
     
     walkers[i] = new Walker();
     walkers[i].position = new PVector(xPos, yPos);
     
     walkers[i].mass = map(i, 0, walkers.length - 1, 8, 1); 
     walkers[i].scale = walkers[i].mass * 15; // Adjusted scale for better visibility
     
     walkers[i].r = random(255);
     walkers[i].g = random(255);
     walkers[i].b = random(255);
   }
}

void draw() {
   background(255);  
   ocean.render();
   
   PVector wind = new PVector(0.15, 0);
   
   for (int i = 0; i < walkers.length; i++) {
     //  GRAVITY 
     PVector gravity = new PVector(0, -0.15f * walkers[i].mass);
     walkers[i].applyForce(gravity);
     
     // LIQUID AND AIR LOGIC
     if (ocean.isCollidingWith(walkers[i])) {
       // Drag Force (Water resistance)
       PVector dragForce = ocean.calculateDragForce(walkers[i]);
       walkers[i].applyForce(dragForce);
     } else {
       walkers[i].applyForce(wind);
     }
     
     walkers[i].update();
     walkers[i].render();
     
     // Floor bounce
     if (walkers[i].position.y <= Window.bottom) {
        walkers[i].position.y = Window.bottom;
        walkers[i].velocity.y *= -0.4; 
     }
     
     // Right Wall Bounce
     if (walkers[i].position.x + (walkers[i].scale / 2) > Window.right) {
        walkers[i].position.x = Window.right - (walkers[i].scale / 2);
        walkers[i].velocity.x *= -0.5f;
      }
   }
}
