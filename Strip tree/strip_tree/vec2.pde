class vec2
{
   public float x;
   public float y;
   
   vec2(int _x, int _y)
   {
         x=_x;
         y=_y;
   }
   
   vec2(float _x, float _y)
   {
         x=_x;
         y=_y;
   }
   
   vec2(vec2 v)
   {
     x=v.x;
     y=v.y;
   }

   vec2 add(vec2 v)
   {
     return new vec2(x+v.x,y+v.y);
   }
   vec2 sub(vec2 v)
   {
        return new vec2(x-v.x,y-v.y);
   }
   vec2 mul(float f)
   {
        return new vec2(x*f,y*f);
   }
   vec2 div(float f)
   {
        return new vec2(x/f,y/f);
   }
   


float mag(vec2 v) {
  return sqrt(v.x*v.x + v.y*v.y);
}

}

float distance(vec2 v1, vec2 v2)
{
   return sqrt((((v1.x-v2.x)*v1.x-v2.x)) + ((v1.y-v2.y)*(v1.y-v2.y)));
}
 
