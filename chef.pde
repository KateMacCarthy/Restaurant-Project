
class Chef extends Person{
  float skill;
  Dish dish;
  boolean cooking, serving;
  
  Chef(int x, int y, float s){
    super(x, y, color(255), "chef");
    this.skill = s;
    this.vel = new PVector(0, 0);
    this.cooking = false;
    this.serving = false;
    dish = null;
  }
}
  
  
  void cook(){
   this.vel = new PVector(0, 0); 
  }
  
  void serve(){
    this.vel = new PVector(-2, 0);
    this.pos.add(this.vel);
  }
  
  void goToStove(){
    this.vel = new PVector(2, 0);
    this.pos.add(this.vel);
  }
  
}
//// Array of chefs
//// equal aray of dishes

////Start at stoves cooking
////When cooked, cooking = false
////If cooking = false, serving = true
////Serve by moving to bar
////serving = false
////goToStove
////(if at stove) cooking = true
