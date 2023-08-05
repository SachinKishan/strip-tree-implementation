import java.util.*;
int x=width;
int y=width;

int oldX=0;
int oldY=0;

boolean drawStrips=true;
float step=1;
float wResolution=2;
ArrayList<vec2> points=new ArrayList<vec2>();  
 float t0,t1;
 
ArrayList<Box> stripList=new ArrayList<Box>();
 
 float INFINITY=999999;
 
vec2 line1=new vec2(400,400);
vec2 line2=new vec2(600,600);
Ray l=new Ray(line1,line2);

vec2 line4=new vec2(0,height);
vec2 line3=new vec2(650,600);
Ray l2=new Ray(line4,line3);

Ray r;

//keeping the curve and strips on the screen without redraws on main
PGraphics pg;


void setup() {
size(800, 800);
frameRate(48);
smooth();
t0=0;
t1=0;
pg=createGraphics(width,height);
pg.smooth(8);
background(180);
  key=ENTER;
lastTime=millis();
stroke(0);
strokeWeight(3);
fill(255, 50);
}
void draw() {

background(180); 
//box_test();
curve_test();
/*pg.beginDraw();
      pg.ellipse(500,500,10,10);
pg.endDraw();
*/
  image(pg, 0, 0); 

}
