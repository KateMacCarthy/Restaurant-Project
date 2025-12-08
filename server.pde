class Server extends Person{
  float skill;
  Dish dish;
  Customer customer;
  String customerSeat;
  boolean hasFood, serving;
  
  Server(float x,float y, float s){
    super(x, y, color(50, 80, 155), "server");
    this.skill = s;
    this.vel = new PVector(0, 0);
    this.serving = false;
    this.hasFood = false;
    this.dish = null;
    this.customer = null;
    this.customerSeat = "";
  }
  
  void moveToDish(Dish d){
    //If they're not at ends of lane yet
    if (this.pos.x < 715){
      //if they are not in a lane
      if ((150<this.pos.y && this.pos.y<320) || (380<this.pos.y && this.pos.y<550)){
        //Closest to top lane
        if (abs(this.pos.y - 125) < abs(this.pos.y - 350)){
          this.pos.add(new PVector(0, -this.skill));
        }
        //Closest to middle lane
        else if (abs(this.pos.y - 350) < abs(this.pos.y - 575)){
          this.vel = new PVector(0, 350-this.pos.y).normalize();
          this.pos.add(this.vel.mult(this.skill));
        }
        //Closest to bottom lane
        else{
          this.pos.add(new PVector(0, this.skill));
        }
      }
      else{ //Walk to end of lane
        this.pos.add(new PVector(this.skill, 0));
      }
    }
    //From ends of lanes, go grab dish
    else{
      this.vel = new PVector(d.pos.x, d.pos.y).sub(this.pos).normalize();
      //Don't step on the bar
      if (this.pos.x+this.vel.x >= 730){
        this.vel.x *= 0;
      }
      this.pos.add(this.vel.mult(skill));
    }
  }
  
  void moveToCustomer(){
    float x = this.customer.pos.x;
    float y = this.customer.pos.y;
    
    if ((50<x && x<90) || (290<x && x<330) || (530<x && x<570)){
      this.customerSeat = "left";
    }
    else if ((180<x && x<270) || (420<x && x<460) || (660<x && x<700)){
      this.customerSeat = "right";
    }
    else if ((150<y && y<190) || (380<y && y<420)){
      this.customerSeat = "up";
    }
    else{
      this.customerSeat = "down";
    }
    
    /////////////////Actually move/////////////////
    if (this.customerSeat == "left" || this.customerSeat == "right"){
      //go to entrance of lane
      if (abs(this.pos.y-y) > 110){
        this.vel = new PVector(700, y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk down lane
      else if (abs(this.pos.x-x) > 35){
        this.vel = new PVector(x, this.pos.y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk closer to person
      else if (this.pos.dist(this.customer.pos) > 30){
        this.vel = new PVector(x, y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
    }
    else if (this.customerSeat == "up"){
      //go to entrance of lane
      if (abs(this.pos.y-(y-25)) > 15){
        this.vel = new PVector(700, y-25).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk down lane
      else if (abs(this.pos.x-x) > 60){
        this.vel = new PVector(x, this.pos.y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk closer to person
      else if (this.pos.dist(this.customer.pos) > 30){
        this.vel = new PVector(x, y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
    }
    else{
      //go to entrance of lane
      if (abs(this.pos.y-(y+25)) > 15){
        this.vel = new PVector(700, y+25).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk down lane
      else if (abs(this.pos.x-x) > 60){
        this.vel = new PVector(x, this.pos.y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk closer to person
      else if (this.pos.dist(this.customer.pos) > 30){
        this.vel = new PVector(x, y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
    }
    //is there now//
  }
  
  void serveCustomer(){
    //place dish in front of customer
    if (this.customerSeat == "left"){
      this.dish.pos = new PVector(this.customer.pos.x+30, this.customer.pos.y);
    }
    else if (this.customerSeat == "right"){
      this.dish.pos = new PVector(this.customer.pos.x-30, this.customer.pos.y);
    }
    else if (this.customerSeat == "up"){
      this.dish.pos = new PVector(this.customer.pos.x, this.customer.pos.y+30);
    }
    else{
      this.dish.pos = new PVector(this.customer.pos.x, this.customer.pos.y-30);
    }
    //reset booleans
    this.customer.dish = this.dish;
    this.dish = null;
    this.customer.eating = true;
    this.customer = null;
    this.serving = false;
  }
  
  
}
// If doesn't have food, pick a dish that is "readyToServe"
// Find a customer who is free, then serving = true
// after served, hasFood=false, serving=false
