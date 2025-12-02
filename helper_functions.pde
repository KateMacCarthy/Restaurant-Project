void createFurniture() {
  for (int i = 0; i < chairs.length; i++){
    chairs[i] = new Furniture(20, color(92, 64, 51), 20 + (i*10), 20 + (i*10));
  }

}
