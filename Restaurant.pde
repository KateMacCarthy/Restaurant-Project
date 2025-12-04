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
String location = "";

float rentPrice;

float numOfServers, numOfChefs;
float serverSkill, chefSkill;
float customerRate, costOfFood;

void setup() {
  size(1000, 600);
  background(225);
  createGUI(); 
  restaurantControls.setVisible(false);
  createNewRestaurant.setVisible(true);
  
  createFurniture();
}

void draw() {
  background(225);
  fill(70);
  rect(750, 0, 40, 600);
  fill(180);
  rect(960, 0, 40, 600);
  
  for (int i = 0; i < chairs.length; i++){
    chairs[i].drawChair();
  }
  
  for (int i = 0; i < tables.length; i++){
    tables[i].drawTable();
  }
  
}
