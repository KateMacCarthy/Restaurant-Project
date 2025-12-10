void createFurniture() {

  //set values for the array table
  for (int i = 0; i < tables.length; i++){
    float x, y;  //new x and y position of each table
    
    if (i < 3) { //If it is one of the first 3 tables it is in first row
      x = 95 + (240*i);  //moves each table over based on their i value
      y = 195; //Location of the first row
    }
    else { //If it is one of the last 3 tables it is in second row
      x = 95 + (240*(i-3));  //moves each table over based on their i value
      y = 425;  //Location of the second row
    }
    
    //Create the table based on the x and y position
    tables[i] = new Furniture(80, color(92, 64, 51), x, y);
  }
  
  //For loop in a for loop to figure out the locations of the chairs
  for (int i = 0; i < tables.length; i++) {
    
    //A PVector for the center of the current table
    PVector tableCenter = new PVector(tables[i].pos.x + 40, tables[i].pos.y + 40);
    int n = 0; //Counter for which side of the table it's on
    
     //A for loop that finds the x and y pos of each chair based on the curr table
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
       
      //Create the chair based on the x and y position
      chairs[j] = new Furniture(40, color(92, 64, 51), x, y);
      n++; //increase side of table counter
    }
  }
}

void createCustomers(){ 
  //Creates a new array based on the customer rate
  customers = new Customer[customerRate];
  
  //goes through the array to create each customer
  for (int i = 0; i < customers.length; i++){
    customers[i] = new Customer(0, 300, "Customer");
  }
}

void createServers(){
  //Creates a new array based on the number of servers
  servers = new Server[numOfServers];
  
  //goes through the array to create each servers
  for (int i = 0; i < servers.length; i++){
    servers[i] = new Server(715, 575, serverSkill);
  }
}

void createChefs(){ 
  //Creates a new array based on the number of chefs
  chefs = new Chef[numOfChefs];
  
  //goes through the array to create each chefs
  for (int i = 0; i < chefs.length; i++){
    chefs[i] = new Chef(945, 30 + i*(height/chefs.length), chefSkill);
  }
}

void createDishes() {
  //Creates a new array of ten dishes
  dishes = new Dish[10];
  
  //goes through the array to create each dish
  for (int i = 0; i < dishes.length; i++){
    dishes[i] = new Dish();
  }
}

void drawPeople() {
  
  //Draws all the customers in the array
  for (int i = 0; i < customers.length; i++){
    customers[i].draw();
  }
  
  //Draws all the servers in the array
  for (int i = 0; i < servers.length; i++){
    servers[i].draw();
  }
  
  //Draws all the chefs in the array
  for (int i = 0; i < chefs.length; i++){
    chefs[i].draw();
  }
}

void drawDishes() {
  
  //Draws all the dishes in the array
  for (int i = 0; i < dishes.length; i++){
    dishes[i].draw();
  }
  
}

void resetBackground(){
  //Sets the background colour
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
  
  //Draws all the chairs in the array
  for (int i = 0; i < chairs.length; i++){
    chairs[i].draw();
  }
  
  //Draws all the tables in the array
  for (int i = 0; i < tables.length; i++){
    tables[i].draw();
  }
  
  //Draws a rectangle that is where the servers and chefs exchange the food
  fill(70);
  rect(750, 0, 40, 600);
  
  //Draws a rectangle that is the stoves the chefs cook on
  fill(180);
  rect(960, 0, 40, 600);
  
  //Draws a rectangle where stats will be displayed
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
  text("Rent Price: $"+ nf(rentPrice, 0, 2), 325, 35);
}
