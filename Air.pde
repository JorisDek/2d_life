class Air {
  int height;
  color air_color;
  
  Air() {
    height = 250;
    air_color = color(2,215,250);
  }
  
  void display() {
    fill(air_color);
    rect(0, 0, 1000, height);
  }
  
  int getHeight() {
    return height;
  }
}