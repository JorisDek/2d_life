//  The World class simply provides two functions, get and set, which access the
//  display in the same way as getPixel and setPixel.  The only difference is that
//  the World class's get and set do screen wraparound ("toroidal coordinates").
class World {
  int days;
  float life_chance;
  float food_chance;
  float start_time;
  float total_hours;
  float total_width;

  World() {
    days = 1;
    life_chance = 0.01;
    food_chance = 0.03;
    start_time = 7;
    total_hours = 24;
    total_width = 2000;
  }
  void day() {
    air.day();
  }
  void night() {
    air.night();
  }
  void incrementDay() {
    days++;
  }
  int getDays() {
    return days;
  }

  void setpix(int x, int y, int c) {
    while(x < 0) x+=width;
    while(x > width - 1) x-=width;
    while(y < 0) y+=height;
    while(y > height - 1) y-=height;
    set(x, y, c);
  }

  color getpix(int x, int y) {
    while(x < 0) x+=width;
    while(x > width - 1) x-=width;
    while(y < 0) y+=height;
    while(y > height - 1) y-=height;
    return get(x, y);
  }

  float getLifeChance() {
    return life_chance;
  }
  float getFoodChance() {
    return food_chance;
  }
}