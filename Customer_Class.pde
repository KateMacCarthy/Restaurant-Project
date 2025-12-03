/////////////////////////////////
// Customer Class
// By Dante
// For the resturant team project
/////////////////////////////////

class Customer extends Person{
  
  // Variables
  
  int patience = 100;
  boolean crashingOut = false; // For when the customer starts CRASHING out
  boolean leaving = false;
  boolean eating = false;
  boolean inResturant = true;
  
  // Constructor
  
  Customer(int x, int y, String s){
    super(x,y,color(47,196,84), s); // Just uses the constructor from the person class
  }
  
  // Functions
  
  
  // The two shared functions
  
  void draw(){
    super.draw(this.inResturant); // Uses the draw function of the person class while parsing the inResturant value
  }
  
  void talk(String s){
    super.talk(s); // Uses the talk function of the person class
  }
  
  //The rest of the functions
  
  void requestWaiter(){
    float closestDist = 1000000; // Set this to an impossibly high number for this to work
    int i = 0; // Create an index value
    int truei; // truei (used for actually calling the waiter later)
    
    for( Waiter currWaiter : waiters){ // Make a for loop that looks through the waiters list
      float distToWaiter = this.pos.dist(currWaiter.pos); // Find out the distance from the current waiter
      
      if(distToWaiter < closestDist && currWaiter.takingOrder = false){ // IF the distance to waiter is shorter than the closestdistance ever AND the waiter is not taking an order
        closestDist = distToWaiter; // Set closest distance to the distance of the current waiter
        truei = i; // Set truei to i
      }
      
      i++; // Increment i by one
      
    }
    
    this.talk("Excuse me I need a waiter!"); // Make the customer ask for a waiter
    waiters[truei].takeOrder(this); // Calls the waiter's takeOrder function
    
  }
  
  void DESTROY(table t){
    int dieroll = int(random(0,7)); // Randomly roll a die
    
    switch(dieroll){ // Switch function (USE THIS INSTEAD OF ELSE IFS IN THE CASE THAT YOU HAVE MORE THAN THREE THINGS YOU NEED TO CHECK AND ITS NOT A RANGE!!!
      case 1: // If the die "Lands" on 1
        this.talk("AHH MY HAND!!!!"); // Make the customer talk
        this.inResturant = false; // In this case, the customer broke their hand so they are hurt A LOT
      case 2:
        this.talk("JUST BREAK ALREADY YOU DARN TABLE!");
        t.takeDamage(2); //Tells the table to take damage (in this case, two damage
      case 3:
       this.talk("JUST BREAK ALREADY YOU DARN TABLE!");
       t.takeDamage(4);
      case 4:
       this.talk("IM GONNA DESTROY THIS DARN THING!");
       t.takeDamage(6);
      case 5:
       this.talk("IM GONNA DESTROY THIS DARN THING!");
       t.takeDamage(10);
      case 6:
       this.talk("I AM SO STRONG!");
       t.destroyed = true; //Just destroys the table
    }
    
  }
  
  void eat(food f, resturant r){
   
    switch(f.quality){ //Check the food quality
      case 1: // If the food is one star
        this.talk("THIS FOOD SUCKS!"); // Make the customer talk
        this.patience -= 50; // Decrease their patience
        this.eating = false; // Make them stop eating
        this.leaving = true; // Make them leave
        r.rating -= 0.5; // Decrease the resturants rating
        
      case 2:
        this.talk("THIS FOOD IS actually not that bad, still a bit bummed out though");
        this.patience -= 25;
        this.eating = false;
        this.leaving = true;
        r.rating -= 0.25;
        
      case 3:
        this.talk("This food is actually pretty good!");
        this.eating = false;
        this.leaving = true;
        r.rating += 0.25; // Increase the resturants rating
       
      case 4:
        this.talk("This food is REALLY good, I'm gonna leave a tip");
        this.eating = false;
        this.leaving = true;
        r.rating += 0.5;
        
      case 5: 
        this.talk("OH MY HECKING SNAPPERDOODLES! THIS FOOD IS THE BEST FOOD I'VE EVER HAD!");
        this.eating = false;
        this.leaving = true;
        r.rating += 1;
    }
  }
  
  // MOVE FUNCTION (SKELETON FOR NOW UNTIL I CAN ACTUALLY FIND OUT HOW TO CODE THIS)
  
  void move(){
   this.pos.add(this.vel.mult(s));
  }

}

// END OF CODE
