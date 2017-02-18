class Sun {
  int x, y;
  int width, height;
  color sun_color; 
  float temp_increase;
  float temp_decrease;
  
  Sun(){
    x = -20;
    y = 20;
    width = height = 20;
    sun_color = color(240,240,3);
    temp_increase = random(0.03);
    temp_decrease = random(-0.03, 0);
    
    //Water water = new Water();
  }
  
  void display() {
    fill(sun_color);
    ellipse(x, y, width, height);
  }
  
  public void setColor(int r, int g, int b) {
    sun_color = color(r,g,b);
  }
  
  float getTempIncrease() {
    return temp_increase;
  }
  
  void setTempIncrease(float inc) {
    temp_increase = inc;
  }
  
  void setTempDecrease(float dec) {
    temp_decrease = dec;
  }
  
  void resetTempIncreaseAndDecrease() {
    temp_increase = random(0.03);
    temp_decrease = random(-0.03, 0);
  }
  
  int getX() {
    return x;
  }
  
  public void move() {
    x++;
    
    if(x >= 0 && x < 1000) {
      float waterTemp = water.getWaterTemp();
      water.setWaterTemp(waterTemp + temp_increase);

      println("temp increase: " + temp_increase + " days: " + w.getDays());
    } else if(x >= 1000 && x < 2000) {
      float waterTemp = water.getWaterTemp();
      water.setWaterTemp(waterTemp + temp_decrease);
      
      air.night();
      
      println("temp decrease: " + temp_decrease + " days: "+ w.getDays());
    } else if(x >= 2000) {
      x = 0;
      resetTempIncreaseAndDecrease();
      w.incrementDay();
      air.day();
      
      println("days: "+ w.getDays());
    }  
  }
}