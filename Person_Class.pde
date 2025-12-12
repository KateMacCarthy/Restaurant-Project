class Person {
  
  // Variables
  PVector vel = new PVector();
  PVector pos = new PVector();
  int s;
  int r = 30;
  color col;
  String name;
  
  // Constructor
  Person(float x, float y, color c, String s){
    this.pos = new PVector(x, y); // Setting the x and y position of pos
    this.s = int(random(1,5)); // Randomly sets the speed from 1-3
    this.col = c; // Sets the color to be c
    this.name = s; // Sets the name to be s
    this.vel = new PVector(0,0);
  }
  
  // Functions
  
  void draw(){
    fill(this.col); // Sets the fill color to col
    circle(this.pos.x, this.pos.y, this.r); // Draws a circle at pos.x,pos.y with a radius of r
  }
  
  void talk(String s){
    println(this.name + ":", s); // Displays what someone is saying in the terminal emulator
  }
}

// END OF CODE
