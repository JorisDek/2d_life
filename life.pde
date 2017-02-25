// import java.util.Iterator;

World w;

int max_creatures = 1000;
int max_food = 2000;

Air air = new Air();
Water water = new Water();
Sun sun  = new Sun();

//Creature[] creatures = new Creature[max_creatures];
//Food[] foods = new Food[max_food];
ArrayList<Creature> creatures = new ArrayList<Creature>();
// Iterator<Creature> creature_iter = creatures.iterator();
ArrayList<Food> foods = new ArrayList<Food>();
// Iterator<Food> food_iter = foods.iterator();

int num_creatures = 0;
int created_creatures = 0;
int num_food = 0;
int created_food = 0;

float time;
// set lower for smoother animation, higher for faster simulation
int runs_per_loop = 10000;
color black = color(0, 0, 0);

PrintWriter output;

void setup() {
  output = createWriter("logs/deadCreatures_"+day()+"-"+month()+"-"+year()+"_"+hour()+minute()+second()+".log");
  size(1000, 1000);
  frameRate(24);
  reset();

}

void reset() {
  clearScreen();
  w = new World();

  //spore_color = color(172, 255, 128);
  //seed();
}

void seed() {
  // Add cells at random places
  //for (int i = 0; i < maxcells; i++)
  //{
  //  int cX = (int)random(width);
  //  int cY = (int)random(height);
  //  if (w.getpix(cX, cY) == black) {
  //    w.setpix(cX, cY, spore_color);
  //    //cells[numcells] = new Creature(cX, cY);
  //    numcells++;
  //  }
  //}
}

void draw() {

  float randomPercent = random(100);

  air.display();
  water.display();
  sun.display();
  sun.move();

  // time = w.total_hours / w.total_width * sun.x + w.start_time;
  // if(time == 24) {
  //   time = 0;
  // }

  /// seizoenen   !!!     dag % 91 == 0 dan volgend seizoen
  fill(240,240,0);
  textSize(18);
  text("Water temp: "+water.getWaterTemp(), 10, 300);
  fill(color(190, 0, 3));
  textSize(16);
  text("Day: " + w.getDays(), 10, 50);
  text("X: "+sun.getX(), 10, 65);
  text("Created Creatures: "+created_creatures, 10, 80);
  text("Created Food: "+created_food, 10, 95);
  //text("Time: "+time, 10, 110);


  // CREATURE LOOP
  for(int c = 0; c < creatures.size(); c++) {
    // println(creature_iter.next());
    // Creature creature = creature_iter.next();
    Creature creature = creatures.get(c);
    if(creature != null) {
     if(creature.getLifeSpan() + creature.getDayOfCreation() > w.getDays()) {                                                               // als de creature niet te oud is
       if(creature.getEnergy() > 0) {                                                                                                          // als de creature nog energie heeft
         if(creature.getMinTemp() < water.getTemp(creature.getY()) && creature.getMaxTemp() > water.getTemp(creature.getY())) {     // als de creature niet in te warm of te koud water is
           creature.loseEnergy();
           creature.display();

           for(int i = foods.size() - 1; i >= 0; i--){  //
             Food food = foods.get(i);
             if(food != null) {
               float distance = dist(creature.x, creature.y, food.x, food.y);
               if(distance < creature.getSize()){
                 creature.eat(food.getEnergy());
                 foods.remove(i);
                 num_food--;
               }
             }
           }

           if(creature.generation == 3) { // als het de derde generatie is
             if(randomPercent > (100 - creature.mutation_rate)) {      // als de het random getal tussen 99.98 en 100 is
               creature.evolve();
             }
           }
           /*
           -- Stage 1 --
           if energy > 200
           kans om te zwemmen of kans op temp aanpassing aan de hand van average of betere/langere resitance
           -- Stage 2 --
           kans om temp te noticen
           -- Stage 3 --
           kans om te breeden
           -- Stage 4 --
           kans om aan te vallen

           ---- Stat increases -----
           */

           if( mouseX > creature.getX() && mouseX < creature.getX() + 5 && mouseY > creature.getY() && mouseY < creature.getY() + 5) {
             if(mousePressed == true) {
               creature.toggleStats();
             }
           }

           if(creature.getEnergy() < 0){
             creatures.remove(c);
             num_creatures--;
           }

         } else {
           println("Creature: " + creature + " is dood. Temperatuur te hoog of te laag.");
           writeLog(creature, "Temperatuur too high or too low.");

           creatures.remove(c);
           num_creatures--;
         }
       } else {
         println("Creature: " + creature + " is dood. Geen energy.");
         writeLog(creature, "No energy.");

         creatures.remove(c);
         num_creatures--;
       }
     } else {
       println("Creature: " + creature + " is dood. Te oud.");
       writeLog(creature, "To old.");
       creatures.remove(c);

       int creatureType = creature.type;
       float creatureX = creature.x;
       float creatureY = creature.y;
       float maxTemp = creature.max_temp;
       float minTemp = creature.min_temp;
       int lifeSpan = creature.life_span;
       float energyDrain = creature.energy_drain;
       int generation = creature.generation + 1;
       //println(w.getDays(), creatureType, creatureX, creatureY, maxTemp, minTemp, lifeSpan, energyDrain, generation);
       //num_creatures--;
       //Als creature dood gaat van ouderdom, spawnt hij een nieuwe creature met zelfde stats en generation + 1.
       creatures.add(new Creature(w.getDays(), creatureType, creatureX, creatureY, maxTemp, minTemp, lifeSpan, energyDrain, generation));
       //println("Creature: New creature!! max_temp: " + creature.getMaxTemp() + " min_temp:"+creature.getMinTemp());

     }
    }
  }

  // FOOD LOOP
  for(int f = 0; f < foods.size(); f++){
    Food food = foods.get(f);
    if(food != null) {
      food.be();
      food.display();

      if( mouseX > food.getX() && mouseX < food.getX() + food.size && mouseY > food.getY() && mouseY < food.getY() + food.size) {
        if(mousePressed == true) {
          food.toggleStats();
        }
      }

      if(food.getEnergy() < 0){
        foods.remove(f);
        num_food--;
      }
    }
  }

  if(randomPercent <= w.getFoodChance()) {
    foods.add(new Food());
    println("Food: New Food!! energy: " + foods.get(num_food).getEnergy());
    num_food++;
    created_food++;
  }
  if(randomPercent <= w.getLifeChance()) {
    created_creatures++;
    creatures.add(new Creature(w.getDays(), created_creatures));
    println("Creature: New creature!! max_temp: " + creatures.get(num_creatures).getMaxTemp() + " min_temp:"+creatures.get(num_creatures).getMinTemp());
    num_creatures++;
  }
}

void clearScreen() {
  background(0);
}

void writeLog(Creature creature, String cause) {
  output.println("Day "+ w.getDays()+ "  X "+sun.getX()  +" "+ cause);
  output.println("Type: " + creature.type);
  output.println("Generation: " + creature.generation);
  output.println("Day of creation: " + creature.day_of_creation);
  output.println("Max temp: " + creature.max_temp );
  output.println("Min temp: " + creature.min_temp );
  output.println("Life span: " + creature.life_span );
  output.println("Energy drain: " + creature.energy_drain );
  output.println("Height: "+ creature.y);
  output.println("Water temp: "+ water.getTemp(creature.y));
  output.println(" ");
  output.flush(); // Writes the remaining data to the file
}
