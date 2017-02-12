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
    temp_increase = random(0.06);
    temp_decrease = random(-0.06, 0);
    
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
  
  void resetTempIncreaseAndDecrease() {
    temp_increase = random(0.06);
    temp_decrease = random(-0.06, 0);
  }
  
  int getX() {
    return x;
  }
  
  public void move() {
    x++;
    
    if(x >= 0 && x < 1000) {
      float waterTemp = water.getWaterTemp();
      water.setWaterTemp(waterTemp + temp_increase);
      
      System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " rand: "+temp_increase+ " days: "+ w.getDays());
    } else if(x >= 1000 && x < 2000) {
      float waterTemp = water.getWaterTemp();
      water.setWaterTemp(waterTemp + temp_decrease);
      System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " rand: "+temp_decrease+ " days: "+ w.getDays());
    }else if(x >= 2000) {
      System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " days: "+ w.getDays());
      x = 0;
      w.incrementDay();
      resetTempIncreaseAndDecrease();
    }
    
    
    //if(x >= 0 && x < 250) {
    //  float temp_increase = random(0.008, 0.02);
      
    //  float waterTemp = water.getWaterTemp();
    //  water.setWaterTemp(waterTemp + temp_increase);
      
    //  System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " rand: "+temp_increase+ " days: "+ w.getDays());
    //} else if(x >= 250 && x < 500) {
    //  float temp_increase = random(0.01, 0.06);
      
    //  float waterTemp = water.getWaterTemp();
    //  water.setWaterTemp(waterTemp + temp_increase);
      
    //  this.setColor(245,240,3);
    //  System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " rand: "+temp_increase+ " days: "+ w.getDays());
    //} else if(x >= 500 && x < 750) {
    //  float temp_increase = random(0.034, 0.08);
      
    //  float waterTemp = water.getWaterTemp();
    //  water.setWaterTemp(waterTemp + temp_increase);
      
    //  this.setColor(255,101,5);
    //  System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " rand: "+temp_increase+ " days: "+ w.getDays());
    //} else if(x >= 750 && x < 1000) {
    //  float temp_increase = random(-0.02, 0.04);
      
    //  float waterTemp = water.getWaterTemp();
    //  water.setWaterTemp(waterTemp + temp_increase);
      
    //  this.setColor(245,240,3);
    //  System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " rand: "+temp_increase+ " days: "+ w.getDays());
    //} else if(x >= 1000 && x < 2000) {
    //  float temp_increase = random(-0.06, 0);
      
    //  float waterTemp = water.getWaterTemp();
    //  water.setWaterTemp(waterTemp + temp_increase);
      
    //  System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " rand: "+temp_increase+ " days: "+ w.getDays());
    //} else if(x >= 2000) {
    //  System.out.println("water_temp: "+ water.getWaterTemp() + " x: "+x+ " days: "+ w.getDays());
    //  x = 0;
    //  w.incrementDay();
    //}
    
    
  }
}