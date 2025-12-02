class Dish{
  PVector pos;
  float sizePlate, sizeFood, grow, price;
  color colPlate, colFood;
  boolean cooked, readyToServe, served, eaten;
  
  Dish(){
    this.pos = new PVector(0, 0);
    this.sizePlate = 10;
    this.sizeFood = 0;
    this.grow = 0;
    this.price = 0;
    this.colPlate = color(220, 220, 220);
    this.colFood = color(255, 220, 150);
    this.cooked = false;
    this.readyToServe = false;
    this.served = false;
    this.eaten = false;
  }
  
  void draw(){
    fill(this.colPlate);
    circle(this.pos.x, this.pos.y, this.sizePlate);
    fill(this.colFood);
    circle(this.pos.x, this.pos.y, this.sizeFood);
  }
  
  void cook(){
    this.sizeFood += this.grow;
  }
  
  void eat(){
    this.sizeFood -= 1;
  }
  
  void follow(Person p){
    this.pos = p.pos;
  }
  
}
//When not cooked, wait for cooked
// When cooked but not ready to serve, follow chef
// WHen at bar, readyToServe
// When server comes, follow server
// When at table, served
// Get eaten until gone.
