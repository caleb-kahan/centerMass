class Rectangle extends Shape{
  float w;
  float h;
  float rotateX;
  float rotateY;
  
  Rectangle(float x, float y, int w, int h, float rotateX, float rotateY){
    super(x,y);
    this.w = w;
    this.h = h;
    this.rotateX = rotateX;
    this.rotateY = rotateY;
  }
  float calculateArea(){
    return w * h;
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
    rect(x,y,w,h);
    popMatrix();
  }
  float calculateCenterX(){
    return x;
  }
  float calculateCenterY(){
    return y;
  }
}
