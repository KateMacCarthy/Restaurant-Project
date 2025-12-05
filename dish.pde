class Dish{
  PVector pos;
  float sizePlate, sizeFood, price;
  color colPlate, colFood;
  boolean start, cooked, readyToServe, served, eaten, taken;
  
  Dish(){
    this.pos = new PVector(0, 0);
    this.sizePlate = 24;
    this.sizeFood = 0;
    this.price = 0;
    this.colPlate = color(220, 220, 220);
    this.colFood = color(255, random(100, 200), 70);
    this.start = true;
    this.cooked = false;
    this.readyToServe = false;
    this.served = false;
    this.eaten = false;
    this.taken = false;
  }
  
  void draw(){
    fill(this.colPlate);
    circle(this.pos.x, this.pos.y, this.sizePlate);
    fill(this.colFood);
    circle(this.pos.x, this.pos.y, this.sizeFood);
  }
  
  void cook(float s){
    this.sizeFood += (s/10);
  }
  
  void eat(){
    this.sizeFood -= 1;
  }
  
  void follow(Person p){
    this.pos = (new PVector(-30, 0)).add(p.pos);
  }
  
}
//When not cooked, wait for cooked
// When cooked but not ready to serve, follow chef
// WHen at bar, readyToServe
// When server comes, follow server
// When at table, served
// Get eaten until gone.
