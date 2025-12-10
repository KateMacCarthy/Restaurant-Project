class Server extends Person{
  //Fields
  float skill;
  Dish dish;
  Customer customer;
  String customerSeat;
  boolean hasFood, serving;
  
  //Constructors
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
  
  //Methods
  
  //Goes to the bar when waiting around
  void moveToBar(){
    //if they are not in a lane, go to the nearest lane
    if ((130<this.pos.y && this.pos.y<340) || (360<this.pos.y && this.pos.y<570)){
      //If closest to top lane
      if (abs(this.pos.y - 125) < abs(this.pos.y - 350)){
        this.pos.add(new PVector(0, -this.skill));
      }
      //If closest to middle lane
      else if (abs(this.pos.y - 350) < abs(this.pos.y - 575)){
        this.vel = new PVector(0, 350-this.pos.y).normalize();
        this.pos.add(this.vel.mult(this.skill));
      }
      //If closest to bottom lane
      else{
        this.pos.add(new PVector(0, this.skill));
      }
    }
    //In the lane, walk to the end
    else{
      if (this.pos.dist(new PVector(725, this.pos.y))> 10){
        this.vel = new PVector(725, this.pos.y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
    }
  }
  
  //Go to selected dish
  void moveToDish(Dish d){
    //If they're not at ends of lane yet, go to the nearest lane and follow it down
    if (this.pos.x < 715){
      if ((130<this.pos.y && this.pos.y<340) || (360<this.pos.y && this.pos.y<570)){
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
  
  //Go to the customer they are currently serving
  void moveToCustomer(){
    float x = this.customer.pos.x;
    float y = this.customer.pos.y;
    
    //See what type of chair the customer is sitting on
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
    
    //Depending on the type of seat, follow a different algorithm to avoid tables and serve the customer
    if (this.customerSeat == "left" || this.customerSeat == "right"){
      //go to entrance of lane if in the middle of table)
      if ((abs(this.pos.y-y) < 100) && (abs(this.pos.x-x) > 200)){
        this.vel = new PVector(710, y+100).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //go to entrance of lane if on either end of table
      else if (abs(this.pos.y-y) > 110){
        this.vel = new PVector(710, y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk down lane
      else if (abs(this.pos.x-x) > 30){
        this.vel = new PVector(x, this.pos.y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk closer to person
      else if (this.pos.dist(this.customer.pos) > 0){
        this.vel = new PVector(x, y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
    }
    else if (this.customerSeat == "up"){
      //go to entrance of lane
      if (abs(this.pos.y-(y-45)) > 10){
        this.vel = new PVector(710, y-45).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk down lane
      else if (abs(this.pos.x-x) > 30){
        this.vel = new PVector(x, this.pos.y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk closer to person
      else if (this.pos.dist(this.customer.pos) > 0){
        this.vel = new PVector(x, y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
    }
    else{
      //go to entrance of lane
      if (abs(this.pos.y-(y+45)) > 15){
        this.vel = new PVector(710, y+45).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk down lane
      else if (abs(this.pos.x-x) > 30){
        this.vel = new PVector(x, this.pos.y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
      //walk closer to person
      else if (this.pos.dist(this.customer.pos) > 0){
        this.vel = new PVector(x, y).sub(this.pos).normalize();
        this.pos.add(this.vel.mult(skill));
      }
    }
  }
  
  //Once at the customer, place down their dish in front of them according to their seat type
  void serveCustomer(){
    if (this.customerSeat == "left"){
      this.dish.pos = new PVector(this.customer.pos.x+45, this.customer.pos.y);
    }
    else if (this.customerSeat == "right"){
      this.dish.pos = new PVector(this.customer.pos.x-45, this.customer.pos.y);
    }
    else if (this.customerSeat == "up"){
      this.dish.pos = new PVector(this.customer.pos.x, this.customer.pos.y+45);
    }
    else{
      this.dish.pos = new PVector(this.customer.pos.x, this.customer.pos.y-45);
    }
    //reset booleans for next iteration
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
