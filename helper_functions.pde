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
  
  for (int i = 0; i < servers.length; i++){
    float x = 800;
    float y = height/2;
    
    chefs[i] = new Chef(x, y, chefSkill);
  }
}

void setGUIValues() {
  if (location.equals("Downtown Toronto")) {
    rentPrice = 5000;
    numOfServers = NumberOfServers.setValue(6);
    numOfChefs = NumberOfChefs.setValue(3);
    serverSkill = ServerSkill.setValue(5);
    chefSkill = ChefSkill.setValue(5);
    customerRate = CustomerRate.setValue(8);
    costOfFood = CostOfFood.setValue(40);
  }
  else if (location.equals("Waterloo")) {
    rentPrice = 3000;
    numOfServers = NumberOfServers.setValue(4);
    numOfChefs = NumberOfChefs.setValue(2);
    serverSkill = ServerSkill.setValue(5);
    chefSkill = ChefSkill.setValue(5);
    customerRate = CustomerRate.setValue(5);
    costOfFood = CostOfFood.setValue(30);
  }
  else if (location.equals("Elora")) {
    rentPrice = 2200;
    numOfServers = NumberOfServers.setValue(2);
    numOfChefs = NumberOfChefs.setValue(1);
    serverSkill = ServerSkill.setValue(5);
    chefSkill = ChefSkill.setValue(5);
    customerRate = CustomerRate.setValue(2);
    costOfFood = CostOfFood.setValue(20);
  }
}
