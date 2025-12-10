void createFurniture() {
  
  for (int i = 0; i < tables.length; i++){
    float x, y;
    
    if (i < 3) {
      x = 95 + (240*i);
      y = 195;
    }
    else {
      x = 95 + (240*(i-3));
      y = 425;
    }
    
    tables[i] = new Furniture(80, color(92, 64, 51), x, y);
  }
  
  for (int i = 0; i < tables.length; i++) {
    PVector tableCenter = new PVector(tables[i].pos.x + 40, tables[i].pos.y + 40);
    int n = 0; //Counter for which side of the table it's on
     for (int j = i*4; j < chairs.length; j++){
       float x = 0; //x pos of the current chair
       float y = 0; //y pos of the current chair
       
       if (n == 0) { //Chair at the top of table
         x = tableCenter.x - 20;
         y = tableCenter.y - 85;
       }
       else if (n == 1) { //Chair at the right of table
         x = tableCenter.x + 45;
         y = tableCenter.y - 20;
       }
       else if (n == 2) { //Chair at the bottom of table
         x = tableCenter.x - 20;
         y = tableCenter.y + 45;
       }
       else if (n == 3) { //Chair at the left of table
         x = tableCenter.x - 85;
         y = tableCenter.y - 20;
       }
       
      chairs[j] = new Furniture(40, color(92, 64, 51), x, y);
      n++;
    }
  }
}

void createCustomers(){ 
  customers = new Customer[customerRate];
  for (int i = 0; i < customers.length; i++){
    customers[i] = new Customer(0, 300, "Customer");
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
    chefs[i] = new Chef(945, 30 + i*(height/chefs.length), chefSkill);
  }
}

void createDishes() {
  dishes = new Dish[10];
  
  for (int i = 0; i < dishes.length; i++){
    dishes[i] = new Dish();
  }
}

void drawPeople() {
  for (int i = 0; i < customers.length; i++){
    customers[i].draw();
  }
  
  for (int i = 0; i < servers.length; i++){
    servers[i].draw();
  }
  
  for (int i = 0; i < chefs.length; i++){
    chefs[i].draw();
  }
}

void drawObjects() {
  
  for (int i = 0; i < chairs.length; i++){
    chairs[i].draw();
  }
  
  for (int i = 0; i < tables.length; i++){
    tables[i].draw();
  }
  
  for (int i = 0; i < dishes.length; i++){
    dishes[i].draw();
  }
  
}

void setGUIValues() {
  serverSkill = 5;
  chefSkill = 5;
  
  if (location.equals("Waterloo")) {
    rentPrice = 3000;
    numOfServers = 4;
    numOfChefs = 2;
    customerRate = 15;
    costOfFood = 30;
  }
  else if (location.equals("Elora")) {
    rentPrice = 2200;
    numOfServers = 2;
    numOfChefs = 1;
    customerRate = 10;
    costOfFood = 20;
  }
  else {
    rentPrice = 5000;
    numOfServers = 6;
    numOfChefs = 3;
    customerRate = 24;
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
  createFurniture();
  createCustomers();
}

void resetBackground(){
  background(225);
  fill(70);
  rect(750, 0, 40, 600);
  fill(180);
  rect(960, 0, 40, 600);
  fill(255);
  rect(0, 0, 600, 100);
}

void resetGUIValues() {
  resetBackground();
  
  numOfServers = NumberOfServers.getValueI();
  numOfChefs = NumberOfChefs.getValueI();
  serverSkill = ServerSkillSlider.getValueI();
  chefSkill = ChefSkillSlider.getValueI();
  customerRate = CustomerRateSlider.getValueI();
  costOfFood = CostOfFoodSlider.getValueF();
  
  NumberOfServers.setValue(numOfServers);
  NumberOfChefs.setValue(numOfChefs);
  ServerSkillSlider.setValue(serverSkill);
  ChefSkillSlider.setValue(chefSkill);
  CustomerRateSlider.setValue(customerRate);
  CostOfFoodSlider.setValue(costOfFood);
  
  createChefs();
  createDishes();
  createServers();
  createFurniture();
  createCustomers();
  
}
