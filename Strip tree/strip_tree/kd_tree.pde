class Strip_node
{
   Box b;
   public Strip_node right;
   public Strip_node left;
   public float xb;
   public float yb;
   public float xe;
   public float ye;
   public float wl;
   public float wr;
   public Strip_node(float _xb,
   float _yb,
   float _xe,
   float _ye,
   float _wl,
   float _wr,
   Box _b)
   {
      xb=_xb;
      xe=_xe;
      yb=_yb;
      ye=_ye;
      wl=_wl;
      wr=_wr;
      right=null;
      left=null;  
      b=_b;
   }
   
   public Strip_node(Strip_node newNode)
   {
      xb=newNode.xb;
      xb=newNode.xb;
      xe=newNode.xe;
      yb=newNode.yb;
      ye=newNode.ye;
      wl=newNode.wl;
      wr=newNode.wr;
      right=null;
      left=null;  
   }
  public Strip_node(){}
   void insert(Strip_node data, String direction)
   {
     if(direction.equals("left"))
     {
       if(left!=null)left.insert(data,direction);
       else 
       {
          println("Inserted to left");
          left=new Strip_node(data);
       }
     }
     else if(direction.equals("right"))
     {
        if(right!=null)
        {
           right.insert(data,direction); 
        }
        else 
        {
           println("Inserted to right");
           right=new Strip_node(data);
        }
     }
   }
};

Strip_node root=new Strip_node();
