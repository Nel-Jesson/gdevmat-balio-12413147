Walker[] walkers = new Walker[100];

void setup()
{
     size(1280, 720, P3D);
     windowMove(displayWidth/2 - width/2, displayHeight/2 - height/2); 
     camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
     
     for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].scale = random(10, 25);
     }
}

void draw()
{
   background(80); 
   
     for (int i = 0; i < walkers.length; i++) {
    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }
}
