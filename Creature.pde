class Creature {
  float size;
  float speed;
  float weight;
  float mutation_rate;
  float x;
  float y;
  float min_temp;
  float max_temp;
  float energy;
  int day_of_creation;
  boolean displayStats = false;
  
  
  Creature(int dayOfCreation) {
    //x = xin;
    //y = yin;
    day_of_creation = dayOfCreation;
    x = random(0, 1000);
    y = random(250, 1000);
    max_temp = random(-200, 200);
    min_temp = random(-200, max_temp - random(50));
    mutation_rate = 0.01;
    energy = 7;
    
  }
  
  void display() {
    fill(color(255, 3, 3));
    ellipse(x, y, 5, 5);
    textSize(14);
    if(displayStats) {
      text("Creation day: "+ day_of_creation, x - 60, y + 20);
      text("Min temp: "+ min_temp, x - 60, y + 35);
      text("Max temp: "+ max_temp, x - 60, y + 50);
    }
  }

    // Perform action based on surroundings
  void run() {
    // Fix cell coordinates
    //while(x < 0) {
    //  x+=width;
    //}
    //while(x > width - 1) {
    //  x-=width;
    //}
    //while(y < 0) {
    //  y+=height;
    //}
    //while(y > height - 1) {
    //  y-=height;
    //}
    
    //// Cell instructions
    //if (w.getpix(x + 1, y) == black) {
    //  move(0, 1);
    //} else if (w.getpix(x, y - 1) != black && w.getpix(x, y + 1) != black) {
    //  move((int)random(9) - 4, (int)random(9) - 4);
    //}
  }
  
  // Will move the cell (dx, dy) units if that space is empty
  void move(int dx, int dy) {
    //if (w.getpix(x + dx, y + dy) == black) {
    //  w.setpix(x + dx, y + dy, w.getpix(x, y));
    //  w.setpix(x, y, color(0));
    //  x += dx;
    //  y += dy;
    //}
  }
  
  float getMutationRate() {
    return mutation_rate;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getMinTemp() {
    return min_temp;
  }
  
  float getMaxTemp() {
    return max_temp;
  }
  
  int getDayOfCreation() {
    return day_of_creation;
  }
  
  void incrementDayOfCreation() {
    day_of_creation++;
  }
  
  void toggleStats() {
    if(displayStats) {
      displayStats = false;
    } else {
      displayStats = true;
    }
  }
}