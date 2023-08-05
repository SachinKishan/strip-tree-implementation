void mouseClicked() {
    //if(drawStrips)

  addPoints();
  
}

void keyPressed() {
  if(drawStrips)
  {
  if(points.size()>2)
  {
    strokeWeight(1);
    drawStrip(points," ");
  }
  points=new ArrayList<vec2>();  
  drawStrips=!drawStrips;
  oldX=0;
  oldY=0;
  }
}

void addPoints()
{
  x=mouseX;
  y=mouseY;
        pg.beginDraw();

pg.strokeWeight(3);
  if(x!=0 && y!=0)
      points.add(new vec2(x,y));
      pg.ellipse(x,y,5,5);
      pg.endDraw();
  if(oldX!=0 || oldY!=0)
  {
pg.beginDraw();
    pg.line(oldX,oldY,x,y);
          pg.endDraw();

  }
  oldX=x;
  oldY=y;
}
