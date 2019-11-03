import java.util.ArrayList;


String mode;
ArrayList<Shape> shapes = new ArrayList<Shape>();
ShapeBuilder masterbuilder;

void setup() {
  size(700, 700);
  background(0);
  mode = "FREE_MODE";
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
}
void draw() {
  background(0);
  fill(255);
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
  rect(width-40, height-100, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Rectangle", width-40, height-100, 80, 50);

  fill(255);
  rect(width-120, height-50, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Quarter_Circle", width-120, height-50, 80, 50);
  
  fill(255);
  rect(width-120, height-100, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Semicircle", width-120, height-100, 80, 50);
  
  fill(255);
  rect(width-200, height-100, 80, 50);
  fill(255, 0, 0);
  fill(0);
  text("Ellipse", width-200, height-100, 80, 50);
}
void mousePressed() {
  if (mode.equals("FREE_MODE")) {
    String shape = determineShape(mouseX, mouseY);
    if (! shape.equals("Nothing")) {
      masterbuilder = new ShapeBuilder(shape);
      mode = "Building_Mode";
    }
  } else if (mode.equals("Building_Mode")) {
    masterbuilder.numClicks += 1;
    masterbuilder.modify();
    boolean resetMode = masterbuilder.shouldRun();
    if (resetMode) {
      mode = "FREE_MODE";
      masterbuilder = null;
    }
  }
}
String determineShape(int x, int y) {
  if (x > width - 80 && y < height - 25 && y > height -75) {
    return "Circle";
  } else if (x > width - 80 && y < height - 75 && y > height -125) {
    return "Rectangle";
  } else if (x > width - 160  && x < width - 80 && y < height - 25 && y > height -75) {
    return "Quarter_Circle";
  } else if (x > width - 160  && x < width - 80 && y < height - 75 && y > height -125) {
    return "Semicircle";
  } else if (x > width - 240  && x < width - 160 && y < height - 75 && y > height -125) {
    return "Ellipse";
  }
  return "Nothing";
}
