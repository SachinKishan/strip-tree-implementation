void line_test()
{
 r=new Ray(new vec2(0,height),new vec2(mouseX,mouseY));
 line(r.origin.x,r.origin.y,r.direction.x,r.direction.y);
 
  line(line4.x,line4.y,line3.x,line3.y);

  //if(lineIntersect(r,l2))println("Intersecting");
  //else println("not intersecting");
}


ArrayList<Box> boxes=new ArrayList<Box>();
vec2 ll=new vec2(100/2,100/2);
   vec2 ul=new vec2(600/2,300/2);
   vec2 ur=new vec2(600/2,600/2);
   vec2 lr=new vec2(100/2,600/2);
   Box b=new Box(ll,ul,ur,lr);
   
   vec2 ll2=new vec2(100,100);
   vec2 ul2=new vec2(600,300);
   vec2 ur2=new vec2(600,600);
   vec2 lr2=new vec2(100,600);
   Box b2=new Box(ll2,ul2,ur2,lr2);
    
   vec2 ll3=new vec2(700,650);
   vec2 ul3=new vec2(750,750);
   vec2 ur3=new vec2(600,650);
   vec2 lr3=new vec2(650,650);
   Box b3=new Box(ll3,ul3,ur3,lr3);   
   
      Box finalBox=b3;

   
void box_test()
{
  r=new Ray(new vec2(0,height),new vec2(mouseX,mouseY));
 line(r.origin.x,r.origin.y,r.direction.x,r.direction.y);
   if(boxes.size()==0)
   {
   boxes.add(b);
   boxes.add(b2);
   boxes.add(b3);
   }
  
   
   
   
   //b2.drawBox();
   
   //b.hit(r);
   //b2.hit(r);
   float t=INFINITY,t0=INFINITY;
   for (Box element : boxes)
   {
            
            t0=element.hit(r,t);
            
            if(t>t0){t=t0;finalBox=element;}
            
   }            if(t!=INFINITY)finalBox.drawBox();;

   /*float t=0;
   t=b.hit(r,t);
   float t0=b2.hit(r,t);
   if(t0<t)t=t0;*/
   vec2 point=r.value(t);
   ellipse(point.x,point.y,10,10);   
   
   
   
   //line(ur.x,ur.y,ul.x,ul.y);
  //if(b.hit(r))println("Intersecting");
  //else println("not intersecting");
  
 // if(lineIntersect(r,new Ray(ur,ul)))println("Intersecting");
  //else println("not intersecting");
  
}
Strip_node temp=new Strip_node(root);
void curve_test()
{
//make curve input
//after curve input, create strips and binary tree
//after strips, shoot ray and test intersections with boxes
  //if(drawStrips)
    //addPoints();
 if(!drawStrips)
 {
   strokeWeight(3);
    r=new Ray(new vec2(0,height),new vec2(mouseX,mouseY));
 line(r.origin.x,r.origin.y,r.direction.x,r.direction.y);
  float t=INFINITY,t0=INFINITY;
          List<Float> floatList = new ArrayList<>();
                  Map<Integer, Float> floatMap = new HashMap<>();\
                  int i=0;
   for (Box element : stripList)
   {
            
            t0=element.hit(r,t);
            
            if(t>t0){t=t0;
        floatMap.put(i,t0);  
        finalBox=element;}
            
            i++;
   }            
   
   
        // Finding the largest float value and its corresponding key in the map
        float largestValue = Float.MIN_VALUE;
        int largestKey = 0;

        for (Map.Entry<Integer, Float> entry : floatMap.entrySet()) {
            int key = entry.getKey();
            float value = entry.getValue();

            if (value > largestValue) {
                largestValue = value;
                largestKey = key;
            }
        }t=largestValue;
        if(largestValue != Float.MIN_VALUE)stripList.get(largestKey).drawBox();
   /*
   test root intersection
   if yes, test two children
     for the one that hits, repeat two children test until no intersection or no children,taking lowst possible resolution
   if no, draw nothing
   
   if(root!=null)
   {
   temp=root;
   t=temp.b.hit(r,t);
   float tr=INFINITY,tl=INFINITY;

   if(t!=INFINITY)
   {
       while(temp.right!=null || temp.left!=null)
       {
         if(temp.right!=null)
           tr=temp.right.b.hit(r,t);
         else tl=temp.left.b.hit(r,t);
       if(tr!=INFINITY){temp=temp.right;t=tr;}
       else if(tl!=INFINITY){temp=temp.left;t=tl;}
       }
   }
   }
   */
   vec2 point=r.value(t);
   ellipse(point.x,point.y,10,10);   

 }
  
}
