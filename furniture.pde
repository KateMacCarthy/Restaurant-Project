class Furniture {
  //Fields
  float sideLength;
  PVector pos;
  color col;
  boolean taken; //used only for chairs to know if they are in use or not
  
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
