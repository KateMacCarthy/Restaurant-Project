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
