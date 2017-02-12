class Water {
  int upper_layer_height;
  int bottom_layer_height; //<>//
  int upper_layer_top;
  int bottom_layer_top;
  color water_color;
  float upper_layer_temp;
  float bottom_layer_temp;
  
  Water() {
    upper_layer_height = 250;
    bottom_layer_height = 500;
    upper_layer_top = 250;
    bottom_layer_top = 500;
    water_color = color(3,54,250);
    upper_layer_temp = 0;
    bottom_layer_temp = 1;
  }
  
  void display() {
    Air air = new Air();
    fill(water_color);
    int air_height = air.getHeight();
    rect(0, air_height, 1000, upper_layer_height);
    fill(23,0,180);
    rect(0, 500, 1000, bottom_layer_height);
  }
  
  void setWaterTemp(float _temp) {
    upper_layer_temp = _temp;
  }
  
  float getWaterTemp() {
    return upper_layer_temp;
  }
  
  int getUpperLayerTop() {
    return upper_layer_top;
  }
  
  int getUpperLayerBottom() {
  return bottom_layer_top;
  }
  
  float getBottomWaterTemp () {
    return bottom_layer_temp;
  }
  
  float getTemp(float position_y) {
    if(position_y > 250 && position_y < 500) {
      return upper_layer_temp;
    }
    else if(position_y >= 500 && position_y < 1000) {
      return bottom_layer_temp;
    } else {
      return 0;
    } 
  }
}