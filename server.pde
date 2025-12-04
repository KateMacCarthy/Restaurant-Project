class Server extends Person{
  float skill;
  boolean hasFood, serving;
  
  Server(int x, int y, float s){
    super(x, y, color(50, 80, 155), "server");
    this.skill = s;
    this.vel = new PVector(0, 0);
    this.serving = false;
    this.hasFood = false;
  }
  
  void moveToDish(Dish d){
    this.vel = PVector.sub(d.pos, this.pos).normalize();
    this.pos.add(PVector.mult(this.vel, skill));
  }
  
  void moveToCustomer(Customer c){
    this.vel = PVector.sub(c.pos, this.pos).normalize();
    this.pos.add(PVector.mult(this.vel, skill));
  }
}
// If doesn't have food, pick a dish that is "readyToServe"
// Find a customer who is free, then serving = true
// after served, hasFood=false, serving=false
