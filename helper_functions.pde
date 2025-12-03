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
