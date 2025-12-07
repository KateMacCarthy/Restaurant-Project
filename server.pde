class Server extends Person{
  float skill;
  Dish dish;
  Customer customer;
  boolean hasFood, serving;
  
  Server(float x,float y, float s){
    super(x, y, color(50, 80, 155), "server");
    this.skill = s;
    this.vel = new PVector(0, 0);
    this.serving = false;
    this.hasFood = false;
    this.dish = null;
    this.customer = null;
  }
  
  void moveToDish(Dish d){
    this.vel = new PVector(d.pos.x, d.pos.y).sub(this.pos).normalize();
    //Don't step on the counters
    if (this.pos.x+this.vel.x >= 730){
      this.vel.x *= 0;
    }
    this.pos.add(this.vel.mult(skill));
  }
  
  void moveToCustomer(Customer c){
    this.vel = new PVector(c.pos.x, c.pos.y).sub(this.pos).normalize();
    this.pos.add(this.vel.mult(skill));
  }
  
  void moveToCustomerLane(Customer c){
    float x = c.pos.x;
    
  }
}
// If doesn't have food, pick a dish that is "readyToServe"
// Find a customer who is free, then serving = true
// after served, hasFood=false, serving=false
