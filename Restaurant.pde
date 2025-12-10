import g4p_controls.*;
PImage floor1, floor2;

//Global Variables
Furniture[] chairs = new Furniture[24];
Furniture[] tables = new Furniture[6];
Server[] servers;
Dish[] dishes;
Chef[] chefs;
Customer[] customers;

//The values that can be adjusted by the sliders
//They are set to the sliders inital value
boolean paused = true;
boolean restaurantCreated = false;

String restaurantName;
String location = " ";

float rentPrice;

int numOfServers, numOfChefs, customerRate;
float serverSkill, chefSkill;
float costOfFood;

void setup() {
  size(1000, 600);
  background(225);
  floor1 = loadImage("floor.jpg");
  floor2 = loadImage("FloorTexture.jpg");
  floor1.resize(150, 150);
  floor2.resize(200, 150);
  createGUI();
  setGUIValues();
  restaurantControls.setVisible(false);
  createNewRestaurant.setVisible(true);
}

void draw() {
  resetBackground();  //Function to reset backgroud and add boxes
  if (restaurantCreated) {
    drawDishes(); //Function to draw dishes
    drawPeople(); //Function to draw all people
  }
  
  if (paused) {
    ////////////////////////////////////////////////SERVERSSSS/////////////////////////
    for (int i = 0; i < servers.length; i++){
      Server currServer = servers[i];
      
      if (currServer.dish == null){ // "Claim" a dish
        for (int n = 0; n < dishes.length; n++){
          //if dish is not cooked and is available, take it
          if (dishes[n].readyToServe == true && dishes[n].taken == false){
            dishes[n].taken = true;
            currServer.dish = dishes[n];
            break;
          }
        }
        if (currServer.dish == null){
          currServer.moveToStart();
        }
      }
      else if (currServer.dish != null && currServer.serving == false){ // Go grab that dish
        if (currServer.pos.dist(currServer.dish.pos) > 45){//move there
          currServer.moveToDish(currServer.dish);
        }
        else{// server is there, now take the dish
          currServer.serving = true;
        }
      }
      else if (currServer.serving == true){
        currServer.dish.follow(currServer);
        if (currServer.customer == null){
          for (int n = 0; n < customers.length; n++){
          //if customer needs help, take it
            if (customers[n].sitting == true && customers[n].beingServed == false){
              customers[n].beingServed = true;
              currServer.customer = customers[n];
              break;
            }
          }
        }
        else if (currServer.customer != null){
          if (currServer.pos.dist(currServer.customer.pos) > 50){
            currServer.moveToCustomer();
          }
          else{
            currServer.serveCustomer();
          }
        }
        
      }
    }
    ////////////////////////////////////////////////SERVERSSSS ENDDD/////////////////////////
  
    ////////////////////////////////////////////////CHEFFSSSSSS/////////////////////////
    for (int i = 0; i < chefs.length; i++){
      Chef currChef = chefs[i]; 
      
      if (currChef.cooking == false && currChef.serving == false){
        if (( 960-currChef.pos.x) > 15){ //If not at stove, go there
          currChef.goToStove();
        }
        else{
          currChef.cooking = true;
        }
      }
      
      else if (currChef.serving == false && currChef.cooking == true){ //They are cooking
        //If don't have a dish, get a dish to cook
        if (currChef.dish == null){
          for (int n = 0; n < dishes.length; n++){
            //if dish is not cooked and is available, take it
            if (dishes[n].cooked == false && dishes[n].taken == false){
              dishes[n].taken = true;
              currChef.dish = dishes[n];
              break;
            }
          }
          if (currChef.dish == null){//ran out of places
            textSize(15);
            fill(0);
            text("Waiting for plates...", currChef.pos.x-125, currChef.pos.y-20);
          }
        }
        //Has dish!
        else if (currChef.dish != null){
          //Summon the dish to the stove!
          currChef.dish.pos = (new PVector(30, 0)).add(currChef.pos);
          //While it's not cooked, keep cooking
          if (currChef.dish.sizeFood < (currChef.dish.sizePlate-5)){
            currChef.dish.cook(currChef.skill);
          }
          //If it's done cooking, stop cooking, begin serving
          else{
            currChef.dish.cooked = true;
            currChef.serving = true;
            currChef.cooking = false;
          }
        }
        
      }
      
      //Bring to bar
      else{
        if ((currChef.pos.x-750) > random(45, 55)){ //If not at stove, go there
          currChef.serve();
          currChef.dish.follow(chefs[i]);
        }
        else{// if they're there
          currChef.cooking = false;
          currChef.serving = false;
          currChef.dish.readyToServe = true;
          currChef.dish.taken = false;
          currChef.dish = null;
        }
      }
     
    }
    ////////////////////////////////////////////////CHEFFSSSSSS ENDDDD/////////////////////////
    
    ////////////////////////////////////////////////CUSTOMERS/////////////////////////
    for (int i = 0; i < customers.length; i++){
      customers[i].move();
      if (customers[i].eating == true){
        customers[i].eat(customers[i].dish);
      }
    }
    ////////////////////////////////////////////////CUSTOMERS ENDDD/////////////////////////
  
  }//End of paused if statement
  
}//End of draw
