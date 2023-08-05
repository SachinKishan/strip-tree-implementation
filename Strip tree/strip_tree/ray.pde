class Ray
{
 public vec2 origin;
 public vec2 direction;
 Ray(vec2 o, vec2 d)
 {
   origin=new vec2(o);
   direction=new vec2(d);
 }
 vec2 value(float t)
 {
   return origin.mul(1-t).add(direction.mul(t));
 }
  
};

boolean lineIntersect(Ray l1, Ray l2)
{
  float a=l1.origin.x;
  float b=l2.origin.x;
  float c=l1.origin.y;
  float d=l2.origin.y;
  float e=l1.direction.x;
  float f=l1.direction.y;
  float g=l2.direction.x;
  float h=l2.direction.y;
  float H=(b-a)/(e-a);
  float P=(g-b)/(e-a);
  float Q=(c-d)/(h-d);
  float R=(f-c)/(h-d);
  float t2=0;
  float t1=0;
  //println("-----");
  if(e==a)//this case cannot happen because a ray cannot be shot directly upward from a camera
  {
    t2=(a-b)/(g-b);
    t1=(l2.value(t2).y-l1.origin.y)/(l1.direction.y-l1.origin.y);
  }
  else if(h==d)
  {
    //println("case h==d");
    t1=(d-c)/(f-c);
    t2=(l1.value(t1).x-l2.origin.x)/(l2.direction.x-l2.origin.x);
    
  }
  else if(f==c)
  {
     //println("case f==c");
     t2=Q; 
     t1=(l2.value(t2).x-l1.origin.x)/(l1.direction.x-l1.origin.x);
  }
  else if(b==g)
  {
     //println("case b==g");
     t1=H;
     t2=(l1.value(t1).y-l2.origin.y)/(l2.direction.y-l2.origin.y);
  }
  else
  {
    t2=(Q+R*H)/(1-R*P);
    t1=H+t2*P;
  }
  //println("t1: "+t1);
  //println("t2: "+t2);

//found
  if(t2>=0 && t2<=1 && t1>=0 && t1<=1)
  {
  //println(t2);
  vec2 point=l1.value(t1);
  //ellipse(point.x,point.y,10,10);
  //println(t1);
  }
  //return t1;
  return t2>=0 && t2<=1 && t1>=0 && t1<=1;
}

float lineIntersectValue(Ray l1, Ray l2)
{
  float a=l1.origin.x;
  float b=l2.origin.x;
  float c=l1.origin.y;
  float d=l2.origin.y;
  float e=l1.direction.x;
  float f=l1.direction.y;
  float g=l2.direction.x;
  float h=l2.direction.y;
  float H=(b-a)/(e-a);
  float P=(g-b)/(e-a);
  float Q=(c-d)/(h-d);
  float R=(f-c)/(h-d);
  float t2=0;
  float t1=0;
  if(e==a)
  {
    t2=(a-b)/(g-b);
    t1=(l2.value(t2).y-l1.origin.y)/(l1.direction.y-l1.origin.y);
  }
  else if(h==d)
  {
    t1=(d-c)/(f-c);
    t2=(l1.value(t1).x-l2.origin.x)/(l2.direction.x-l2.origin.x);    
  }
  else if(f==c)
  {
     t2=Q; 
     t1=(l2.value(t2).x-l1.origin.x)/(l1.direction.x-l1.origin.x);
  }
  else if(b==g)
  {
     t1=H;
     t2=(l1.value(t1).y-l2.origin.y)/(l2.direction.y-l2.origin.y);
  }
  else
  {
    t2=(Q+R*H)/(1-R*P);
    t1=H+t2*P;
  }
  if(t2>=0 && t2<=1 && t1>=0 && t1<=1)
  return t1;
  else return -2;
}

class Box
{
  vec2 a;  
  vec2 b;
  vec2 c;
  vec2 d;
  Ray A;
  Ray B;
  Ray C;
  Ray D;
  

  Box(vec2 _a, vec2 _b, vec2 _c, vec2 _d )
  {
    a=new vec2(_a);
    b=new vec2(_b);
    c=new vec2(_c);
    d=new vec2(_d);
    A=new Ray(a,b);
    B=new Ray(b,c);
    C=new Ray(c,d);
    D=new Ray(d,a);
  }
  
 void drawBox()
 {
   line(a.x,a.y,b.x,b.y);
   line(b.x,b.y,c.x,c.y);
   line(c.x,c.y,d.x,d.y);
   line(d.x,d.y,a.x,a.y);

 }
  
  boolean hit(Ray r) 
  {
    float t=INFINITY;//start t at infinity
    if(lineIntersect(r,A))t=lineIntersectValue(r,A);
    float t0=lineIntersectValue(r,B);
    if(t0<t && t0>=0 && t0<=1)t=t0;
    t0=lineIntersectValue(r,C);
    if(t0<t && t0>=0 && t0<=1)t=t0;    
    t0=lineIntersectValue(r,D);
    if(t0<t && t0>=0 && t0<=1)t=t0;    
    //vec2 point=r.value(t);
    //ellipse(point.x,point.y,10,10);    
    return lineIntersect(r,A)||lineIntersect(r,B)||lineIntersect(r,C)||lineIntersect(r,D);
  }
  float hit(Ray r, float t1) 
  {
    float t=INFINITY;//start t at infinity
    t1=t;
    if(lineIntersect(r,A))t=lineIntersectValue(r,A);
    float t0=lineIntersectValue(r,B);
    if(t0<t && t0>=0 && t0<=1)t=t0;
    t0=lineIntersectValue(r,C);
    if(t0<t && t0>=0 && t0<=1)t=t0;    
    t0=lineIntersectValue(r,D);
    if(t0<t && t0>=0 && t0<=1)t=t0;    
    //vec2 point=r.value(t);
    //ellipse(point.x,point.y,10,10);   
   // if(lineIntersect(r,A)||lineIntersect(r,B)||lineIntersect(r,C)||lineIntersect(r,D))
     return t;  
  }
}
