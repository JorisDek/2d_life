class Creature {
  int type;
  float size = 5;
  float mutation_rate = 0.0;
  float speed;
  float weight;
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
  int mutation_stage = 0;
  int eaten_food = 0;
  int display_direction;


  Creature(int dayOfCreation, int _type) {
    type = _type;
    day_of_creation = dayOfCreation;
    x = random(0, 1000);
    y = random(250, 1000);
    max_temp = random(-200, 200);
    min_temp = random(-200, max_temp - random(50));
    life_span = int(random(25, 35));
    energy = random(30, 50);
    energy_drain = random(0.0001, 0.005);
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
    energy = random(30, 50);
    energy_drain = _energydrain;
    generation = _gen;
  }

  void display() {
    fill(color(255, 3, 3));
    ellipse(x, y, size, size);
    textSize(14);
    if(displayStats) {
      if(height - y < 125) {
        display_direction = -1;
      } else {
        display_direction = 1;
      }
      text("Type: "+ type + " Gen: "+ generation, x - 60, y + (20 * display_direction));
      text("Creation day: "+ day_of_creation, x - 60, y + (35 * display_direction));
      text("Min temp: "+ min_temp, x - 60, y + (50 * display_direction));
      text("Max temp: "+ max_temp, x - 60, y + (65 * display_direction));
      text("Life span: "+ life_span, x - 60, y + (80 * display_direction));
      text("Energy: "+ energy, x - 60, y + (95 * display_direction));
      text("Energy drain: "+ energy_drain, x - 60, y + (110 * display_direction));
      text("Eaten food: "+ eaten_food, x - 60, y + (125 * display_direction));
    }
  }

  void loseEnergy() {
    energy = energy - energy_drain;
  }

  // Perform action based on surroundings
  void run() {

  }

  void move() {

  }

  void eat(float _energy) {
    eaten_food++;
    energy = energy + _energy;
    output.println("Creature: " + this.type);
    output.println("Eaten! energy: " + _energy);
    output.println(" ");
  }

  void mutate() {
    mutation_stage++;
    int random = int(random(3));
      if(random == 1) {
        //better life_span
        life_span = life_span + int(random(1, 5));
      } else if(random == 2) {
        //better temp_range
        max_temp = max_temp + random(0, 25);
        min_temp = min_temp - random(0, 25);
      } else if(random == 3) {
        //better energydrain
        energy_drain = energy_drain - random(0, 0.00005);
      }
      println("Creature: mutated to stage "+ mutation_stage +". Random "+ random);
    
    //switch(mutation_stage) {
    //  case 1:
    //    int random = int(random(3));
    //    if(random == 1) {
    //      //better life_span
    //      life_span = life_span + int(random(1, 5));
    //    } else if(random == 2) {
    //      //better temp_range
    //      max_temp = max_temp + random(0, 25);
    //      min_temp = min_temp - random(0, 25);
    //    } else if(random == 3) {
    //      //better energydrain
    //      energy_drain = energy_drain - random(0, 0.00005);
    //    }
    //    println("Creature: mutated to stage "+ mutation_stage +". Random "+ random);
    //    break;
    //  case 2:
    //    random = int(random(3));
    //    println("Creature: mutated to stage 2");
    //    break;
    //  default:
    //    println("Invalid stage.");
    //    break;
    //}
  }

  float getMutationRate() {
    switch(mutation_stage) {
      case 0:
        mutation_rate = 0.001;
        return mutation_rate;
      case 1:
        mutation_rate = 0.0005;
        return mutation_rate;
      case 2:
        mutation_rate = 0.0001;
        return mutation_rate;
      default:
        mutation_rate = 0;
        return mutation_rate;
    }
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

  void setLifeSpan(int _lifespan) {
    life_span = _lifespan;
  }

  float getEnergy() {
    return energy;
  }

  void setEnergy(float _energy) {
    energy = _energy;
  }

  float getSize() {
    return size;
  }

  int getType() {
    return type;
  }
  
}