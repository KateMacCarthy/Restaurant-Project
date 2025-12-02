<<<<<<< Updated upstream
//class Server extends Person{
=======
class Server extends Person{
  float skill;
  boolean hasFood, serving;
>>>>>>> Stashed changes
  
  Server(float x, float y, float s){
    super(x, y, color(50, 80, 155), "server");
    this.skill = s;
    this.vel = new PVector(0, 0);
    this.serving = false;
    this.hasFood = false;
  }
  
  void moveToDish(Dish d){
    this.vel = d.pos.sub(this.pos).normalize();
    this.pos.add(this.vel.mult(skill));
  }
  
  void moveToCustomer(Customer c){
    this.vel = c.pos.sub(this.pos).normalize();
    this.pos.add(this.vel.mult(skill));
  }
  
  
<<<<<<< Updated upstream
//}
=======
}
// If doesn't have food, pick a dish that is "readyToServe"
// Find a customer who is free, then serving = true
// after served, hasFood=false, serving=false
>>>>>>> Stashed changes
