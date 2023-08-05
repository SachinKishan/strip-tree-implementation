 float calculatePerpDistance(float x1, float y1, float x2, float y2, float x3, float y3, String type) {
   int dir=1;
  /* if(x1>x2 && type.equals("dx"))
   {
         dir=-1;
        float temp=x2;
        x2=x1;
        x1=temp;
        
        temp=y2;
        y2=y1;
        y1=temp;
   }
   else if(y1<y2 && type.equals("dy"))
   {
         dir=-1;
        float temp=x2;
        x2=x1;
        x1=temp;
        
        temp=y2;
        y2=y1;
        y1=temp;
   }*/
   
   // Step 1: Calculate the slope (m) and y-intercept (b) of the line passing through points A and B
        float m = (y2 - y1) / (x2 - x1);
        float b = y1 - m * x1;
        //println("m= "+m);
        // Step 2: Calculate the slope (mp) and y-intercept (bp) of the perpendicular line passing through point C
        float mp = -1 / m;
        float bp = y3 - mp * x3;

        // Step 3: Find the intersection point of the two lines
        float x = (bp - b) / (m - mp);
        if(abs(x)<0.1)x=0;
        float y = m * x + b;
        
        // Step 4: Calculate the distance between the intersection point and point C
        float distance = sqrt(pow(x3 - x, 2) + pow(y3 - y, 2));
        //println("final dist=" + distance);
        return distance*dir;
    }


void drawPerpendicular(vec2 xs, vec2 xe, float dx, float dy, float d )
{
   float len = sqrt(dx*dx+dy*dy);
   float perpx = -dy * d / len;
   float perpy = dx * d / len;
float x1 = xs.x + perpx;
float y1 = xs.y + perpy;
float x2 = xe.x + perpx;
float y2 = xe.y + perpy;
line(x1,y1,x2,y2);   

ellipse(x1,y1,5,5);
ellipse(x2,y2,3,3);

}

void drawBox(vec2 xs, vec2 xe, float dx, float dy, float d1, float d2, String dir)
{
  float d=d1;
   float len = sqrt(dx*dx+dy*dy);
   float perpx = -dy * d / len;
   float perpy = dx * d / len;
float x1 = xs.x + perpx;
float y1 = xs.y + perpy;
float x2 = xe.x + perpx;
float y2 = xe.y + perpy;
d=d2;
len = sqrt(dx*dx+dy*dy);
perpx = -dy * d / len;
perpy = dx * d / len;
float x3 = xs.x + perpx;
float y3 = xs.y + perpy;
float x4 = xe.x + perpx;
float y4 = xe.y + perpy;

Box b=new Box(new vec2(x1,y1),new vec2(x2,y2),new vec2(x4,y4),new vec2(x3,y3));
stripList.add(b);
Strip_node data=new Strip_node(xs.x,xs.y,xe.x,xe.y,d1,d2,b);
        if(dir.equals(" "))
        {
          root=new Strip_node(xs.x,xs.y,xe.x,xe.y,d1,d2,b);
        }
        else 
          root.insert(data,dir);
        


pg.beginDraw();
pg.strokeWeight(0.5);
pg.line(x1,y1,x2,y2);   
pg.line(x3,y3,x4,y4);  
pg.line(x1,y1,x3,y3);
pg.line(x2,y2,x4,y4);
pg.endDraw();

}

vec2[] perpPoint(vec2 xs, vec2 xe, float dx, float dy, float d )
{
   float len = sqrt(dx*dx+dy*dy);
   float perpx = -dy * d / len;
   float perpy = dx * d / len;
float x1 = xs.x + perpx;
float y1 = xs.y + perpy;
float x2 = xe.x + perpx;
float y2 = xe.y + perpy;
vec2 perpPoints[]=new vec2[2];
perpPoints[0]=new vec2((int)x1,(int)y1);  
println("Upper in function: "+perpPoints[0].x+" "+perpPoints[0].y);
ellipse(perpPoints[0].x,perpPoints[0].y,3,3);
perpPoints[1]=new vec2((int)x2,(int)y2);   
return perpPoints;
}

void drawStrip(ArrayList<vec2> points, String dir)
{
   vec2 xs=points.get(0);
   vec2 xe=points.get(points.size()-1);
   float x2=xe.x;
   float x1=xs.x;
   float y1=xs.y;
   float y2=xe.y;
   float dx = x2 - x1;
   float dy = y2 - y1;
   boolean alongy=abs(dy)>abs(dx);
   float xmin=width+1;
   float ymin=height+1;
   float xmax=-1;
   float ymax=-1;
   
   
   int yminCoord=0,xminCoord=0,ymaxCoord=0,xmaxCoord=0;
   
   //find furthest points from given line
   /*for(int i=0;i<points.size();i++)
   {
      if(ymax<points.get(i).y){ymax=points.get(i).y;ymaxCoord=i;}
      if(ymin>points.get(i).y){ymin=points.get(i).y;yminCoord=i;}
      if(xmax<points.get(i).x){xmax=points.get(i).x;xmaxCoord=i;}
      if(xmin>points.get(i).x){xmin=points.get(i).x;xminCoord=i;}
   }*/
   float dr=0,dl=0;int pr=0,pl=0;
   for(int i=1;i<points.size()-1;i++)
   {
      vec2 temp=points.get(i);
      //https://math.stackexchange.com/questions/274712/calculate-on-which-side-of-a-straight-line-is-a-given-point-located
      float dist=(temp.x-x1)*(y2-y1)-(temp.y-y1)*(x2-x1);
      if(dist>dr){dr=dist;pr=i;}
      if(dist<dl){dl=dist;pl=i;}
   }
   int next;
   //if(pl!=0 && pl!=points.size()-1)next=pl;
   if(pr!=0 && pr!=points.size()-1) next=pr;
   else if(pl!=0 && pl!=points.size()-1)next=pl;
   else next=-1;
   
  // line(xs.x,xs.y,xe.x,xe.y);
   /*line(xs.x,xs.y,points.get(pr).x,points.get(pr).y);
      line(xs.x,xs.y,points.get(pl).x,points.get(pl).y);

   line(xe.x,xe.y,points.get(pl).x,points.get(pl).y);
   line(xe.x,xe.y,points.get(pr).x,points.get(pr).y);
*/
   
   //calculate parallel lines to draw border of box

    float d1=0,d2=0;
  /*  if(alongy)
    {
      print("dy>dx");
        d1 = calculatePerpDistance(xs.x,xs.y,xe.x,xe.y,points.get(pl).x,points.get(pl).y,"dy");
        d2 = calculatePerpDistance(xs.x,xs.y,xe.x,xe.y,points.get(pr).x,points.get(pr).y,"dy");
    }
    else
    {
        d1 = calculatePerpDistance(xs.x,xs.y,xe.x,xe.y,points.get(pl).x,points.get(pl).y,"dx");
        d2 = calculatePerpDistance(xs.x,xs.y,xe.x,xe.y,points.get(pr).x,points.get(pr).y,"dx");
    }*/
    
    d1 = calculatePerpDistance(xs.x,xs.y,xe.x,xe.y,points.get(pl).x,points.get(pl).y,"dy");
    d2 = calculatePerpDistance(xs.x,xs.y,xe.x,xe.y,points.get(pr).x,points.get(pr).y,"dy");
    if(d1<0.1 || d1!=d1)d1=0;
    if(d2<0.1 || d2!=d2)d2=0;
    println(d1);
    println(d2);
    //drawPerpendicular(xs,xe,dx,dy,d1);
    //drawPerpendicular(xs,xe,dx,dy,-d2);
    drawBox(xs,xe,dx,dy,d1,-d2, dir);
    
    if(next!=-1)
    {
    // Create a sublist of vec2 objects
       
        int startIndex = 1;
        int endIndex = next;
        // Create a new ArrayList and copy the sublist elements to it
        ArrayList<vec2> right = new ArrayList<>();
        ArrayList<vec2> left = new ArrayList<>();

        for (int i = 0; i <= endIndex; i++) 
        {
            left.add(points.get(i));
        }
        for (int i = endIndex; i < points.size(); i++) 
        {
            right.add(points.get(i));
        }
        
        
        
        //drawing the boxes
          if(right.size()>wResolution-1)
          {
            drawStrip(right,"right");
          }
          if(left.size()>wResolution-1)
          {
            drawStrip(left,"left");
          }
    }
}
