import java.util.ArrayList;

PImage img;
String mode;
ArrayList<Shape> shapes = new ArrayList<Shape>();
ShapeBuilder masterbuilder;

void setup() {
  size(700, 700);
  background(0);
  mode = "FREE_MODE";
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  img = loadImage("snakemaster.png");
}
void draw() {
  background(0);
  image(img, 0, 0, 559*1.1,477*1.1);
  fill(255);
  stroke(255, 0, 0);
  for (Shape shape : shapes) { 
    shape.display();
  }
  if (mode.equals("Building_Mode")) {
    masterbuilder.run();
  }
  text(mode, 400, 400);
  fill(255);
  rect(width-40, height-50, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Circle", width-40, height-50, 80, 50);

  fill(255);
  rect(width-40, height-120, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Rectangle", width-40, height-120, 80, 50);

  fill(255);
  rect(width-140, height-50, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Quarter_Circle", width-140, height-50, 80, 50);
  
  fill(255);
  rect(width-140, height-120, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Semicircle", width-140, height-120, 80, 50);
  
  fill(255);
  rect(width-240, height-120, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Ellipse", width-240, height-120, 80, 50);
  
  fill(255);
  rect(width-240, height-50, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Triangle", width-240, height-50, 80, 50);
  
  fill(255);
  rect(width-340, height-50, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("CircSegment", width-340, height-50, 80, 50);
  
  fill(0,255,0);
  rect(width-340, height-120, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("UNDO", width-340, height-120, 80, 50);
}
void mousePressed() {
  if (mode.equals("FREE_MODE")) {
    String shape = determineShape(mouseX, mouseY);
    if(shape.equals("UNDO") && shapes.size()>0){
      shapes.remove(shapes.size() - 1);
    }
    else if (! shape.equals("Nothing")) {
      masterbuilder = new ShapeBuilder(shape);
      mode = "Building_Mode";
    }
  } else if (mode.equals("Building_Mode")) {
    masterbuilder.numClicks += 1;
    masterbuilder.modify();
    boolean resetMode = masterbuilder.shouldRun();
    if (resetMode) {
      mode = "FREE_MODE";
      Shape newShape = masterbuilder.build();
      shapes.add(newShape);
      masterbuilder = null;
    }
  }
}
String determineShape(int x, int y) {
  if (x > width - 100 && x < width - 20 && y < height - 25 && y > height -75) {
    return "Circle";
  } else if (x > width - 100 && x < width - 20 && y < height - 95 && y > height -145) {
    return "Rectangle";
  } else if (x > width - 180  && x < width - 100 && y < height - 25 && y > height -75) {
    return "Quarter_Circle";
  } else if (x > width - 180  && x < width - 100 && y < height - 95 && y > height -145) {
    return "Semicircle";
  } else if (x > width - 280  && x < width - 200 && y < height - 95 && y > height -145) {
    return "Ellipse";
  } else if (x > width - 280  && x < width - 200 && y < height - 25 && y > height -75) {
    return "Triangle";
  } else if (x > width - 380  && x < width - 300 && y < height - 25 && y > height -75) {
    return "CircSegment";
  } else if (x > width - 380  && x < width - 300 && y < height - 95 && y > height -145) {
    return "UNDO";
  }
  return "Nothing";
}
