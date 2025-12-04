
class Chef extends Person{
  float skill;
  boolean cooking, serving;
  
  Chef(float x, float y, float s){
    super(x, y, color(255), "chef");
    this.skill = s;
    this.vel = new PVector(0, 0);
    this.cooking = true;
  }
}
  
  
//  void cook(){
//   this.vel = new PVector(0, 0); 
//  }
  
//  void serve(){
//    this.vel = new PVector(-2, 0);
//  }
  
//  void goToStove(){
//    this.vel = new PVector(2, 0);
//  }
  
//}
//// Array of chefs
//// equal aray of dishes

////Start at stoves cooking
////When cooked, cooking = false
////If cooking = false, serving = true
////Serve by moving to bar
////serving = false
////goToStove
////(if at stove) cooking = true
