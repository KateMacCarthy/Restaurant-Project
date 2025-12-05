void createFurniture() {
  for (int i = 0; i < chairs.length; i++){
    float x = 20 + (i*45);
    float y = 20;
    
    chairs[i] = new Furniture(40, color(92, 64, 51), x, y);
  }
  
  for (int i = 0; i < tables.length; i++){
    float x = 20 + (i*105);
    float y = 100;
    
    tables[i] = new Furniture(100, 80, color(92, 64, 51), x, y);

  }
}

void createServers(){ 
  servers = new Server[numOfServers];
  
  for (int i = 0; i < servers.length; i++){
    servers[i] = new Server(715, 575, serverSkill);
  }
}

void createChefs(){ 
  chefs = new Chef[numOfChefs];
  
  for (int i = 0; i < chefs.length; i++){
    chefs[i] = new Chef(800, 30 + i*(height/chefs.length), chefSkill);
  }
}

void createDishes() {
  dishes = new Dish[10];
  
  for (int i = 0; i < dishes.length; i++){
    dishes[i] = new Dish();
  }
  
}

void setGUIValues() {
  serverSkill = 5;
  chefSkill = 5;
  
  if (location.equals("Waterloo")) {
    rentPrice = 3000;
    numOfServers = 4;
    numOfChefs = 2;
    customerRate = 5;
    costOfFood = 30;
  }
  else if (location.equals("Elora")) {
    rentPrice = 2200;
    numOfServers = 2;
    numOfChefs = 1;
    customerRate = 2;
    costOfFood = 20;
  }
  else {
    rentPrice = 5000;
    numOfServers = 6;
    numOfChefs = 3;
    customerRate = 8;
    costOfFood = 40; 
  }
  
  NumberOfServers.setValue(numOfServers);
  NumberOfChefs.setValue(numOfChefs);
  ServerSkillSlider.setValue(serverSkill);
  ChefSkillSlider.setValue(chefSkill);
  CustomerRateSlider.setValue(customerRate);
  CostOfFoodSlider.setValue(costOfFood);

  createChefs();
  createDishes();
  createServers();
  //createFurniture();
}

void resetBackground(){
  background(225);
  fill(70);
  rect(750, 0, 40, 600);
  fill(180);
  rect(960, 0, 40, 600);
}
