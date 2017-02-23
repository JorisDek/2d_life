class Creature {
  int type;
  float size = 5;
  float speed;
  float weight;
  float mutation_rate;
  float x;
  float y;
  float min_temp;
  float max_temp;
  float energy;
  float energy_drain;
  int day_of_creation;
  int life_span;
  boolean displayStats = false;
  int generation;
  
  
  Creature(int dayOfCreation, int _type) {
    type = _type;
    day_of_creation = dayOfCreation;
    x = random(0, 1000);
    y = random(250, 1000);
    max_temp = random(-200, 200);
    min_temp = random(-200, max_temp - random(50));
    mutation_rate = 0.01;
    energy = 7;
    life_span = int(random(25, 35));
    energy = random(30, 50);
    energy_drain = random(0.005);
    generation = 1;
  }
  
  Creature(int dayOfCreation, int _type, float _x, float _y, float _maxtemp, float _mintemp, int _lifespan, float _energydrain, int _gen) {
    type = _type;
    day_of_creation = dayOfCreation;
    x = _x;
    y = _y;
    max_temp = _maxtemp;
    min_temp = _mintemp;
    energy = 7;
    life_span = _lifespan;
    energy = 7;
    energy_drain = _energydrain;
    generation = _gen;
  }
  
  void display() {
    fill(color(255, 3, 3));
    ellipse(x, y, size, size);
    textSize(14);
    if(displayStats) {
      text("Type: "+ type + " Gen: "+ generation, x - 60, y + 20);
      text("Creation day: "+ day_of_creation, x - 60, y + 35);
      text("Min temp: "+ min_temp, x - 60, y + 50);
      text("Max temp: "+ max_temp, x - 60, y + 65);
      text("Life span: "+ life_span, x - 60, y + 80);
      text("Energy: "+ energy, x - 60, y + 95);
      text("Energy drain: "+ energy_drain, x - 60, y + 110);
    }
  }

  // Perform action based on surroundings
  void run() {

  }
  
  void move() {
    
  }
  
  void eat(float _energy) {
    energy = energy + _energy;
    output.println("Eaten! energy: " + energy);
    output.println(" ");
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
  
  int getLifeSpan() {
    return life_span;
  }
  
  void setLifeSpan(int lifespan) {
    life_span = lifespan;
  }
  
  float getEnergy() {
    return energy;
  }
  
  void setEnergy(float _energy) {
    energy = _energy;
  }
  
  void loseEnergy() {
    energy = energy - energy_drain;
  }
  
  float getSize() {
    return size;
  }
  
  int getType() {
    return type;  
  }
}