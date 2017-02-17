class Food {
  float x, y;
  int size;
  float energy;
  color food_color;
  float speed_x;
  int direction;
  float energy_loss;
  boolean displayStats = false;

  Food() {
    x = random(0, 1000);
    y = random(250, 1000);
    size = 3;
    energy = random(0.2);
    food_color = color(64, 255, 8);
    if(x < 500){
      direction = 1;
    } else {
      direction = -1;
    }
    speed_x = 0.1;
    energy_loss = random(0.0001);
  }
  
  void be() {
    this.move();
    this.loseEnergy();
  }
  
  void display() {
    fill(food_color);
    ellipse(x, y, size, size);
    if(displayStats) {
      textSize(14);
      text("Energy: "+ energy, x - 60, y + 20);
      text("Energy loss: "+ energy_loss, x - 60, y + 35);
    }
  }
  void move() {
    x = x + (speed_x * direction);
    if(x > width - size || x < size) {
      direction *= -1;
    }
  }
  void loseEnergy() {
    energy = energy - energy_loss;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getEnergy() {
    return energy;
  }
  
   void toggleStats() {
    if(displayStats) {
      displayStats = false;
    } else {
      displayStats = true;
    }
  }
}