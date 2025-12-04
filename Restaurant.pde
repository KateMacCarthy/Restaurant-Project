import g4p_controls.*;

//Global Variables
Furniture[] chairs = new Furniture[24];
Furniture[] tables = new Furniture[6];
Chef[] chefs;
Server[] servers;

//The values that can be adjusted by the sliders
//They are set to the sliders inital value
boolean paused = true;

String restaurantName;
String location;

float rentPrice;

int numOfServers;
int numOfChefs;
int serverSkill;
int chefSkill;
int customerRate = 2;
int costOfFood = 20;

void setup() {
  size(1000, 600);
  background(255);
  //createGUI(); 
  
  createFurniture();
}

void draw() {
  background(255);
  
  for (int i = 0; i < chairs.length; i++){
    chairs[i].drawChair();
  }
  
  for (int i = 0; i < tables.length; i++){
    tables[i].drawTable();
  }
  
}
