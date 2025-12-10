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

void resetGUIValues() {
  if (!restaurantCreated){}
  else {
  
  if (NumberOfServers != null) {
    numOfServers = NumberOfServers.getValueI();
  }
  if (NumberOfChefs != null) { 
    numOfChefs = NumberOfChefs.getValueI();
  }
  if (ServerSkillSlider != null) {
    serverSkill = ServerSkillSlider.getValueI();
  }
  if (ChefSkillSlider != null) {
    chefSkill = ChefSkillSlider.getValueI();
  }
  if (CustomerRateSlider != null) {
    customerRate = CustomerRateSlider.getValueI();
  }
  if (CostOfFoodSlider != null) {
    costOfFood = CostOfFoodSlider.getValueF();
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
}
