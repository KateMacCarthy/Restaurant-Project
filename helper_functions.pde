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

void drawDishes() {
  
  for (int i = 0; i < dishes.length; i++){
    dishes[i].draw();
  }
  
}

void resetBackground(){
  background(225);
  for(int x = 0; x < 5; x++){
    for(int y = 0; y < 4; y++){
      image(floor1, x*150, y*150);
    }
  }
  for(int x = 4; x < 5; x++){
    for(int y = 0; y < 4; y++){
      image(floor2, (x-0.15)*200, y*150);
    }
  }
  
  for (int i = 0; i < chairs.length; i++){
    chairs[i].draw();
  }
  
  for (int i = 0; i < tables.length; i++){
    tables[i].draw();
  }
  
  fill(70);
  rect(750, 0, 40, 600);
  fill(180);
  rect(960, 0, 40, 600);
  fill(255);
  rect(0, 0, 600, 100);
}

void displayProfit(){
  textSize(30);
  fill(40, 155, 0);
  text("Profit:", 15, 35);
  textSize(23);
  //text("Earned:", 270, 35);
  fill(200, 0, 0);
  text("Wage cost:", 325, 80);
  text("Ingredient cost:", 15, 80);
  text("Rent Price: $"+ rentPrice, 325, 35);
}
