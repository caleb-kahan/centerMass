class Ellipse extends Shape{
  float w;
  float h;
  float rotateX;
  float rotateY;
  
  Ellipse(float x, float y, int w, int h, float rotateX, float rotateY){
    super(x,y);
    this.w = w;
    this.h = h;
    this.rotateX = rotateX;
    this.rotateY = rotateY;
    this.comX = calculateCenterX();
    this.comY = calculateCenterY();
    this.area = calculateArea();
  }
  float calculateArea(){
    return w/2 * h/2 * PI;
  }
  float angle(float x, float y, float rotateX, float rotateY){
    if(rotateX-x>0)
      return atan((rotateY-y)/(rotateX-x+0.0000001));
    else
      return atan((rotateY-y)/(rotateX-x+0.0000001)) + PI;
  }
  void display(){
    stroke(255, 0, 0);
    pushMatrix();
    translate(x,y);
    rotate(angle(x,y,rotateX,rotateY));
    translate(-x,-y);
    ellipse(x, y, w, h);
    popMatrix();
    super.display();
  }
  float calculateCenterX(){
    return x;
  }
  float calculateCenterY(){
    return y;
  }
}
