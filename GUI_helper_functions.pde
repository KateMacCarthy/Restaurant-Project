void setGUIValues() {
  //Sets the default skill values
  serverSkill = 5;
  chefSkill = 5;
  
  //If the location pick is Waterloo set variable based on that
  if (location.equals("Waterloo")) {
    rentPrice = 3000.00;
    numOfServers = 4;
    numOfChefs = 2;
    customerRate = 15;
    costOfFood = 30;
  }
  
  //If the location pick is Elora set variable based on that
  else if (location.equals("Elora")) {
    rentPrice = 2200.00;
    numOfServers = 2;
    numOfChefs = 1;
    customerRate = 10;
    costOfFood = 20;
  }
  
  //If the location pick is Toronto set variable based on that
  else {  //Toronto is the first option so if they don't change it it will be toronto
    rentPrice = 5000.00;
    numOfServers = 6;
    numOfChefs = 3;
    customerRate = 24;
    costOfFood = 40; 
  }
  
  //Set the values of the sliders based on the set variables
  NumberOfServers.setValue(numOfServers);
  NumberOfChefs.setValue(numOfChefs);
  ServerSkillSlider.setValue(serverSkill);
  ChefSkillSlider.setValue(chefSkill);
  CustomerRateSlider.setValue(customerRate);
  CostOfFoodSlider.setValue(costOfFood);

  //Create the arrays of things based on the values above
  createChefs();
  createDishes();
  createServers();
  createFurniture();
  createCustomers();
}

void resetGUIValues() {
  //If the restaurant hasn't been created do nothing
  if (!restaurantCreated){}
  
  //Otherwise set the vaules based on the sliders
  else {
  
  //Set the variables to be the slider values if they aren't null
  //This is probably overkill but we kept getting a nullPointerError because of something to due with the sliders
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
  
  //Create the arrays of things based on the variables above
  createChefs();
  createDishes();
  createServers();
  createFurniture();
  createCustomers();
  }
}
