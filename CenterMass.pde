import java.util.ArrayList;


String mode;
ArrayList<Shape> shapes = new ArrayList<Shape>();
ShapeBuilder masterbuilder;

void setup(){
  size(800, 800);
  background(0);
  stroke(0);
  mode = "FREE_MODE";
  rectMode(CENTER);
}
void draw(){
  fill(255);
  for (Shape shape : shapes) { 
    shape.display();
  }
  fill(255);
  rect(width-75,height-50,75,50);
  fill(255,0,0);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Circle",width-75,height-50,75,50);
  
  fill(255);
  rect(width-75,height-100,75,50);
  fill(255,0,0);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Rectangle",width-75,height-100,75,50);
  
}
void mousePressed() {
  if(mode.equals("FREE_MODE")){
    int random1 = 200+ (int)(Math.random()*100);
    random1 *= (random1%2==0) ? 1 : -1;
    int random2 = 200+ (int)(Math.random()*100);
    random2 *= (random2%2==0) ? 1 : -1;
    Circle c = new Circle(random1,random2,50);
    shapes.add(c);
    
  }
  else if(mode.equals("Building_Mode")){
    masterbuilder.numClicks += 1;
    boolean resetMode = masterbuilder.run();
    if(resetMode){
      mode = "FREE_MODE";
      masterbuilder = null;
    }
  }
}
