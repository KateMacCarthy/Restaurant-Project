import g4p_controls.*;

//Global Variables
Furniture[] chairs = new Furniture[24];
Furniture[] tables = new Furniture[6];
Server[] servers;
Dish[] dishes;
Chef[] chefs;
Customer[] customers;
//Customer customer = new Customer(0, 300, "customer");
//Chef chef = new Chef(800, 30, 1);

//The values that can be adjusted by the sliders
//They are set to the sliders inital value
boolean paused = true;

String restaurantName;
String location = " ";

float rentPrice;

int numOfServers, numOfChefs, customerRate;
float serverSkill, chefSkill;
float costOfFood;

void setup() {
  size(1000, 600);
  background(225);
  createGUI(); 
  restaurantControls.setVisible(false);
  createNewRestaurant.setVisible(true);
  
  createChefs();
  createDishes();
  createServers();
  createFurniture();
  createCustomers();
}

void draw() {
  resetBackground();
  
  for (int i = 0; i < chairs.length; i++){
    chairs[i].drawChair();
  }
  
  //for (int i = 0; i < tables.length; i++){
  //  tables[i].drawTable();
  //}
  
  for (int i = 0; i < customers.length; i++){
    customers[i].draw();
  }
  
  for (int i = 0; i < servers.length; i++){
    servers[i].draw();
  }
  
  for (int i = 0; i < chefs.length; i++){
    chefs[i].draw();
  }
  
  for (int i = 0; i < dishes.length; i++){
    if (dishes[i].start == true){
      dishes[i].draw();
    }
  }
  
  if (paused) {
    ////////////////////////////////////////////////SERVERSSSS/////////////////////////
    for (int i = 0; i < servers.length; i++){
      if (servers[i].dish == null){ // "Claim" a dish
        for (int n = 0; n < dishes.length; n++){
          //if dish is not cooked and is available, take it
          if (dishes[n].readyToServe == true && dishes[n].taken == false){
            dishes[n].taken = true;
            servers[i].dish = dishes[n];
            break;
          }
        }
      }
      else if (servers[i].dish != null && servers[i].serving == false){ // Go grab that dish
        if (servers[i].pos.dist(servers[i].dish.pos) > 45){//move there
          servers[i].moveToDish(servers[i].dish);
        }
        else{// server is there, now take the dish
          servers[i].serving = true;
        }
      }
      else if (servers[i].serving == true){
        servers[i].dish.follow(servers[i]);
        if (servers[i].customer == null){
          for (int n = 0; n < customers.length; n++){
          //if customer needs help, take it
            if (customers[n].sitting == true && customers[n].beingServed == false){
              customers[n].beingServed = true;
              servers[i].customer = customers[n];
              break;
            }
          }
        }
        else if (servers[i].customer != null){
          //make it go to customers, etc.
          //need table & chair locations
          //hard code lanes ^-^
          //
        }
        
      }
    }
    ////////////////////////////////////////////////SERVERSSSS ENDDD/////////////////////////
  
    ////////////////////////////////////////////////CHEFFSSSSSS/////////////////////////
    for (int i = 0; i < chefs.length; i++){
      
      if (chefs[i].cooking == false && chefs[i].serving == false){
        if (( 960-chefs[i].pos.x) > 15){ //If not at stove, go there
          chefs[i].goToStove();
        }
        else{
          chefs[i].cooking = true;
        }
      }
      
      else if (chefs[i].serving == false && chefs[i].cooking == true){ //They are cooking
        //If don't have a dish, get a dish to cook
        if (chefs[i].dish == null){
          for (int n = 0; n < dishes.length; n++){
            //if dish is not cooked and is available, take it
            if (dishes[n].cooked == false && dishes[n].taken == false){
              dishes[n].start = true;
              dishes[n].taken = true;
              chefs[i].dish = dishes[n];
              break;
            }
          }
          if (chefs[i].dish == null){//ran out of places
            textSize(15);
            fill(0);
            text("Waiting for plates...", chefs[i].pos.x-125, chefs[i].pos.y-20);
          }
        }
        //Has dish!
        else if (chefs[i].dish != null){
          //Summon the dish to the stove!
          chefs[i].dish.pos = (new PVector(30, 0)).add(chefs[i].pos);
          //WHile it's not cooked, keep cooking
          if (chefs[i].dish.sizeFood < (chefs[i].dish.sizePlate-5)){
            chefs[i].dish.cook(chefs[i].skill);
          }
          //If it's done cooking, stop cooking, begin serving
          else{
            chefs[i].dish.cooked = true;
            chefs[i].serving = true;
            chefs[i].cooking = false;
          }
        }
        
      }
      
      //Bring to bar
      else{
        if ((chefs[i].pos.x-750) > random(45, 55)){ //If not at stove, go there
          chefs[i].serve();
          chefs[i].dish.follow(chefs[i]);
        }
        else{// if they're there
          chefs[i].cooking = false;
          chefs[i].serving = false;
          chefs[i].dish.readyToServe = true;
          chefs[i].dish.taken = false;
          chefs[i].dish = null;
        }
      }
     
    }
    ////////////////////////////////////////////////CHEFFSSSSSS ENDDDD/////////////////////////
    
    ////////////////////////////////////////////////CUSTOMERS/////////////////////////
    for (int i = 0; i < customers.length; i++){
      customers[i].move();
    }
    ////////////////////////////////////////////////CUSTOMERS ENDDD/////////////////////////
  
  }
  
}
