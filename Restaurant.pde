import g4p_controls.*;

//Global Variables
Furniture[] chairs = new Furniture[24];
Furniture[] tables = new Furniture[6];
Chef[] chefs;
Server[] servers;

//The values that can be adjusted by the sliders
//They are set to the sliders inital value
int numOfServers = 4;
int numOfChefs = 1;
int serverSkill = 5;
int chefSkill = 5;
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
