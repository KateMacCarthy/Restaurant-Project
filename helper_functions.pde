void createFurniture() {
  for (int i = 0; i < chairs.length; i++){
    float x = 20 + (i*35);
    float y = 20;
    
    chairs[i] = new Furniture(30, color(92, 64, 51), x, y);
  }
  
  for (int i = 0; i < tables.length; i++){
    float x = 20 + (i*65);
    float y = 100;
    
    tables[i] = new Furniture(60, 50, color(92, 64, 51), x, y);

  }
}

void createServers(){ 
  servers = new Server[numOfServers];
  
  for (int i = 0; i < servers.length; i++){
    float x = 700;
    float y = height/2;
    
    servers[i] = new Server(x, y, serverSkill);
  }
}

void createChefs(){ 
  chefs = new Chef[numOfChefs];
  
  for (int i = 0; i < chefs.length; i++){
    float x = 800;
    float y = height/2;
    
    chefs[i] = new Chef(x, y, chefSkill);
  }
}

void setGUIValues() {
  serverSkill = 5;
  chefSkill = 5;
  
  if (location.equals("Downtown Toronto")) {
    rentPrice = 5000;
    numOfServers = 6;
    numOfChefs = 3;
    customerRate = 8;
    costOfFood = 40;
  }
  else if (location.equals("Waterloo")) {
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
  
  NumberOfServers.setValue(numOfServers);
  NumberOfChefs.setValue(numOfChefs);
  ServerSkillSlider.setValue(serverSkill);
  ChefSkillSlider.setValue(chefSkill);
  CustomerRateSlider.setValue(customerRate);
  CostOfFoodSlider.setValue(costOfFood);

}
