class Furniture{
  //Fields
  float w, h, sideLength;
  PVector pos;
  color col;
  
  //Constructor
  Furniture(float w, float h, color col, float x, float y) {
    this.w = w;
    this.h = h;
    this.pos = new PVector(x, y);
    this.col = col;
  }
  
  Furniture(float sl, color col, float x, float y) {
    this.sideLength = sl;
    this.col = col;
    this.pos = new PVector(x, y);
  }
  
  
  //Methods
  void drawChair() {
    fill(col);
    square(this.pos.x, this.pos.y, sideLength);
  }
  
  void drawTable() {
    fill(col);
    rect(this.pos.x, this.pos.y, w, h);
  }
}
