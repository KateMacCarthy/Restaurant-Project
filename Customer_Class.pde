class Customer extends Person{
  
  // Variables
  
  int patience = 100;
  boolean crashingOut = false; // For when the customer starts CRASHING out
  boolean leaving = false;
  boolean eating = false;
  boolean inRestaurant = true;
  boolean beingServed = false;
  boolean sitting = false;
  float speed = random(1, 5);
  Dish dish = null;
  Furniture chair = null;
  
  // Constructor
  
  Customer(float x, float y, String s){
    super(x, y, color(47,196,84), s); // Just uses the constructor from the person class
  }
  
  // Functions
  
  
  // The two shared functions
  
  void draw(){
    super.draw(); // Uses the draw function of the person class while parsing the inRestaurant value
  }
  
  // findChair function
  
  Furniture findChair(){
    float closestDist = 1000000; // Set this to an impossibly high number for this to work
    int i = 0; // Create an index value
    int truei = 0; // truei (used for actually returning the right chair)
    
    for( Furniture currChair : chairs){ // Make a for loop that looks through the chairs list
      float distToChair = this.pos.dist(currChair.pos); // Find out the distance from the current chair
      
      if((distToChair < closestDist) && !currChair.taken){ // IF the distance to chair is shorter than the closestdistance ever AND the chair is not taking an order
        closestDist = distToChair; // Set closest distance to the distance of the current chair
        truei = i;
      }
      i++;
    }
    return chairs[truei];
  }
  
  //moveToChair
  
  void moveToChair(Furniture c){
    PVector displacement = PVector.sub(c.pos, this.pos); // Find out the displacement between the chair and the customer
    float angle = displacement.heading(); // Find out the angle of the chair to the customer
    PVector direction = new PVector ( cos(angle), sin(angle) ); // Properly calculate the "direction" (more or so where the vector is pointing) that the customer should be going
    this.vel = direction.mult( this.s ); // Make the velocity the "direction" variable multiplied by the speed of the customer
  }
  
  void moveToExit(){
    PVector displacement = PVector.sub(new PVector(0,300), this.pos); // Find out the displacement between the chair and the customer
    float angle = displacement.heading(); // Find out the angle of the chair to the customer
    PVector direction = new PVector ( cos(angle), sin(angle) ); // Properly calculate the "direction" (more or so where the vector is pointing) that the customer should be going
    this.vel = direction.mult( this.s ); // Make the velocity the "direction" variable multiplied by the speed of the customer
  }
  
  
  // MOVE FUNCTION (SKELETON FOR NOW UNTIL I CAN ACTUALLY FIND OUT HOW TO CODE THIS)
  
  void move(){
    
    if(!eating && !sitting && !leaving && !crashingOut && inRestaurant){ //If the customer just entered the restaurant
      if (this.chair == null){
        this.chair = this.findChair(); // Find the closest chair
        if (this.chair == null);
          this.chair.taken = true;
      }
      else{
        this.moveToChair(this.chair); // Move to the chiar
      }
      
      this.pos.add(this.vel);   
    
      if(chair.pos.dist(this.pos) <= this.r){
        this.pos.x = chair.pos.x + (chair.sideLength / 2);
        this.pos.y = chair.pos.y + (chair.sideLength / 2);
        this.sitting = true;
      }
      
    }
    
    else if(!eating && !sitting && leaving && inRestaurant){
      this.moveToExit();
      this.pos.add(this.vel);
      if(this.pos.x <= 10 && abs(this.pos.y-300)<10){
        this.inRestaurant = false;
        this.leaving = false;
      }
    }
    
    else{
      int i = int(random(0,300));
      if(i == 3){
        this.inRestaurant = true;
      }
    }
    
  }
  
  //Eat selected dish
  void eat(Dish d){
    //If food is still on plate, keep eating
    if (d.sizeFood >0){
      d.sizeFood -= 0.1;
    }
    else{
      //When eaten, reset booleans for next iteration
      d.cooked = false;
      d.readyToServe = false;
      d.taken = false;
      this.chair.taken = false;
      this.eating = false;
      this.beingServed = false;
      this.sitting = false;
      this.leaving = true;
      this.dish = null;
      this.chair = null;
      earned += 1;
    }
  }
  
 }

// END OF CODE
