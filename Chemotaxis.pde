
Bacteria[] bacteria = new Bacteria[50];

void setup()
{
  size(400, 400);
  
  for(int i = 0; i < bacteria.length; i++)
  {
    color bacteriaColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    bacteria[i] = new Bacteria(200, 200, bacteriaColor);
  }
}

void draw()
{
  background(55);
  
  for(int i = 0; i < bacteria.length; i++)
  {
    bacteria[i].biasedMove();
    bacteria[i].show();
  }
}

class Bacteria
{
  int myX;
  int myY;
  color myColor;
  
  Bacteria(int x_, int y_, color color_)
  {
    myX = x_;
    myY = y_;
    myColor = color_;
  }
  
  void move()
  {
    myX += (int)(Math.random()*5)-2;
    myY += (int)(Math.random()*5)-2;
  }
  
  void biasedMove()
  {
    int distToMouse = (int)Math.sqrt(Math.pow(myX - mouseX, 2) + Math.pow(myY - mouseY, 2));
    int multiplier;
    
    if(mousePressed)
      multiplier = 1; // attract if mouse is pressed
    else
      multiplier = -1; // repel if not pressed
    
    if(distToMouse < 50)
    {
      if (myX > mouseX)
         myX += ((int)((Math.random()*3) - 3) * multiplier);
      else
        myX += ((int)((Math.random()*3) + 3) * multiplier);
      if (myY > mouseY)
        myY += ((int)((Math.random()*3) - 3) * multiplier);
      else
        myY += ((int)((Math.random()*3) + 3) * multiplier);
    }
    else
    {
      move();
    }
  }
  
  void show()
  {
    fill(myColor);
    ellipse(myX, myY, 15, 15);
  }
}
