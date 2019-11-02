import java.util.ArrayList;


String mode;
ArrayList<Shape> shapes = new ArrayList<Shape>();
ShapeBuilder masterbuilder;

void setup(){
  size(800, 800);
  background(0);
  mode = "FREE_MODE";
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
}
void draw(){
  fill(255);
  for (Shape shape : shapes) { 
    shape.display();
  }
  fill(255);
  rect(width-75,height-50,80,50);
  fill(255,0,0);
  fill(0);
  text("Circle",width-75,height-50,80,50);
  
  fill(255);
  rect(width-75,height-100,80,50);
  fill(255,0,0);
  fill(0);
  text("Rectangle",width-75,height-100,80,50);
  
}
void mousePressed() {
  if(mode.equals("FREE_MODE")){
    String shape = determineShape(mouseX,mouseY);
    if(! shape.equals("Nothing")){
      fill(255);
      int random1 = 200+ (int)(Math.random()*100);
      random1 *= (random1%2==0) ? 1 : -1;
      int random2 = 200+ (int)(Math.random()*100);
      random2 *= (random2%2==0) ? 1 : -1;
      text(shape, random1,random2,80,50);
    }
    //masterbuilder = new ShapeBuilder(mouseX,mouseY,null);
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
String determineShape(int x, int y){
  if(y < height - 25 && y > height -75){
    return "Circle";
  }
  else if(y < height - 75 && y > height -125){
    return "Rectangle";
  }
  return "Nothing";
}
