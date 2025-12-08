class Furniture {
  //Fields
  float w, h, sideLength;
  PVector pos;
  color col;
  boolean taken;
  
  //Constructor
  Furniture(float sl, color col, float x, float y) {
    this.sideLength = sl;
    this.col = col;
    this.taken = false;
    this.pos = new PVector(x, y);
  }
  
  
  //Methods
  void draw() {
    fill(col);
    square(this.pos.x, this.pos.y, sideLength);
  }
  
}
