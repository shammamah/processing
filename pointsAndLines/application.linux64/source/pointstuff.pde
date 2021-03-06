public int w = 700; 
public int h = 700; 
public int fr = 5000; 

public int mindRGB = -10; 
public int maxdRGB = 10; 
public int minRGB = 100; 
public int maxRGB = 205; 


public int r = minRGB; 
public int g = minRGB; 
public int b = minRGB; 


public int bg = 0; 


public Boolean randomize = false; 

public int maxdx = 10; 
public int mindx = -maxdx; 
public int maxdy = 10; 
public int mindy = -maxdy; 

final class point{ 
  private int x, y; 
  
  public int getX(){
    return this.x; 
  }
  
  public int getY(){
    return this.y; 
  } 
  
  public point(int xcoord, int ycoord, ArrayList<point> pts){
   
    x = xcoord; 
    y = ycoord; 
    
   for(point pt : pts){
      line(x, y, pt.getX(), pt.getY());
   }
    
   pts.add(this); 
   
  }
   
  public void move(int r, int u, ArrayList<point> pts){
    if(this.x + r > w){
      r = -(w-this.x); 
    }
    if(this.x + r < 0){
      r = -r; 
    }
    if(this.y + u > h){
      u = -(h-this.y); 
    }
    if(this.y + u < 0){
      u = -u; 
    }
    this.x += r; 
    this.y += u; 
      
    for(point pt : pts){
      if(pt == this){
        continue; 
      } 
      line(x, y, pt.getX(), pt.getY());
    }
  }  
}
  
ArrayList<point> points = new ArrayList<point>();

void mousePressed(){
  if(randomize){
    new point(int(random(0,w)), int(random(0,h)), points); 
  }
  else{
    new point(mouseX, mouseY, points); 
  }
}

void lineColor(){
  int dr = int(random(mindRGB,maxdRGB));
  int dg = int(random(mindRGB,maxdRGB));
  int db = int(random(mindRGB,maxdRGB));
  if(r+dr < minRGB || r+dr > maxRGB){
    dr = -dr; 
  }
  if(g+dg < minRGB || g+dg > maxRGB){
    dg = -dg; 
  }
  if(b+db < minRGB || b+db > maxRGB){
    db = -db; 
  }
  r += dr; 
  g += dg; 
  b += db; 
}

void setup(){
  size(700,700); 
  strokeWeight(0.5); 
  frameRate(fr);
  draw(); 
}

void draw(){ 
  clear(); 
  background(bg); 
  lineColor(); 
  stroke(r,g,b); 
  for(point pt : points){
    pt.move(int(random(mindx, maxdx)),int(random(mindy, maxdy)), points); 
  }
}