class Person {
  
  PVector velocity, pos;
  int speed;
  int r = 15;
  color col;
  String name;
  
  
  Person(int x, int y, color c, String s){
    this.pos.x = x;
    this.pos.y = y;
    this.speed = int(random(1,3));
    this.col = c;
    this.name = s;
  }
  
  void draw(){
    fill(col);
    circle(this.pos.x, this.pos.y, r);
  }
  
  void talk(String s){
    println(this.name + ":", s);
  }
  

}
