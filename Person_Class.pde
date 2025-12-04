class Person {
  
  // Variables
  
  PVector vel, pos;
  int s;
  int r = 15;
  color col;
  String name;
  
  // Constructor
  
  Person(int x, int y, color c, String s){
    this.pos = new PVector(x, y); // Setting the x and y position of pos
    this.s = int(random(1,3)); // Randomly sets the speed from 1-3
    this.col = c; // Sets the color to be c
    this.name = s; // Sets the name to be s
  }
  
  // Functions
  
  void draw(boolean f){
    if(f = true){ // Checks to see if F is true (mostly to see if someone is within the resturant or something like that
      fill(this.col); // Sets the fill color to col
      circle(this.pos.x, this.pos.y, this.r); // Draws a circle at pos.x,pos.y with a radius of r
    }
  }
  
  void talk(String s){
    println(this.name + ":", s); // Displays what someone is saying in the terminal emulator
  }
  

}

// END OF CODE
