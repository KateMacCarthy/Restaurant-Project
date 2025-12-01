class Furniture{
  //Fields
  float w, h;
  PVector pos;
  color col;
  
  //Constructor
  Furniture() {
    this.w = 10;
    this.h = 5;
    this.pos = new PVector(75, 30);
    this.col = color(92, 64, 51);
  
  }
  
  
  //Methods
  void drawMe() {
    fill(col);
    rect(this.pos.x, this.pos.y, w, h);
  
  }
}
