World w;

int num_creatures = 0;
int max_creatures = 1000;
int created_creatures = 0;

int num_food = 0;
int max_food = 2000;
int created_food = 0;

// set lower for smoother animation, higher for faster simulation
int runs_per_loop = 10000;
color black = color(0, 0, 0);
Air air = new Air();
Water water = new Water();
Sun sun  = new Sun();
Creature[] creatures = new Creature[max_creatures];
Food[] foods = new Food[max_food];
PrintWriter output;
  
void setup() {
  output = createWriter("deadCreatures_"+day()+"-"+month()+"-"+year()+"_"+hour()+minute()+second()+".log"); 
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
  // Run cells in random order
  //for (int i = 0; i < runs_per_loop; i++) {
  //  int selected = min((int)random(numcells), numcells - 1);
  //  cells[selected].run();
  //}
  float randomPercent = random(100);
  
  air.display();
  water.display();
  sun.display();
  sun.move();
  
  
  fill(240,240,0);
  textSize(18);
  text("Water temp: "+water.getWaterTemp(), 10, 300);
  fill(color(190, 0, 3));
  textSize(16);
  text("Day: "+w.getDays(), 10, 50);
  text("X: "+sun.getX(), 10, 65);
  text("Created Creatures: "+created_creatures, 10, 80);
  text("Created Food: "+created_food, 10, 95);
  
  
  
  for(int c = 0; c < num_creatures; c++){
    if(creatures[c] != null) {
      if(creatures[c].getLifeSpan() + creatures[c].getDayOfCreation() > w.getDays()) {           // als de creature niet te oud is
        if(creatures[c].getEnergy() != 0) {                                                      // als de creature nog energie heeft
          if(creatures[c].getMinTemp() < water.getTemp(creatures[c].getY()) && creatures[c].getMaxTemp() > water.getTemp(creatures[c].getY())) {    //als de creature niet in te warm of te koud water is
            creatures[c].loseEnergy();
            creatures[c].display();
            
            for(int i = 0; i < num_food; i++) {  //
              if(foods[i] != null) {
                float distance = dist(creatures[c].x, creatures[c].y, foods[i].x, foods[i].y);
                
                if(distance < creatures[c].getSize()){
                  creatures[c].eat(foods[i].getEnergy());
                  foods[i] = null;
                  num_food--;
                }
              }
            }
            /* Na 100 dagen in leven
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
            
            if( mouseX > creatures[c].getX() && mouseX < creatures[c].getX() + 5 && mouseY > creatures[c].getY() && mouseY < creatures[c].getY() + 5) {
              if(mousePressed == true) {
                creatures[c].toggleStats();
              }
            } 
            
            if(creatures[c] != creatures[0]){
              if(creatures[c-1] == null) {
                creatures[c-1] = creatures[c];
                creatures[c] = null;
              }
            }
            if(creatures[c] != null) {
              if(creatures[c].getEnergy() < 0){
                creatures[c] = null;
                num_creatures--;
              }
            }
          } else {
            println("Creature: " + creatures[c] + " is dood. Temperatuur te hoog of te laag.");
            writeLog(creatures[c], "Temperatuur too high or too low.");
            
            creatures[c] = null; 
            num_creatures--;
          }
        } else {
          println("Creature: " + creatures[c] + " is dood. Geen energy.");
          writeLog(creatures[c], "No energy.");
          
          creatures[c] = null; 
          num_creatures--;
        }
      } else {
        println("Creature: " + creatures[c] + " is dood. Te oud.");
        writeLog(creatures[c], "To old.");
        
        creatures[c] = null; 
        num_creatures--;
      }
    }
  }
  
  for(int f = 0; f < num_food; f++){
    if(foods[f] != null) {
      foods[f].be();
      foods[f].display();

      if( mouseX > foods[f].getX() && mouseX < foods[f].getX() + 3 && mouseY > foods[f].getY() && mouseY < foods[f].getY() + 3) {
        if(mousePressed == true) {
          foods[f].toggleStats();
        }
      }
      //if(foods[f] != foods[0]){
      //  if(foods[f - 1] == null) {
      //    foods[f - 1] = foods[f];
      //    foods[f] = null;
      //  }
      //}
     
      if(foods[f].getEnergy() < 0){
        foods[f] = null;
        num_food--;
      }
    } else {
      if(foods[f+1] != null) {
        foods[f] = foods[f+1];
        foods[f+1] = null;
        
        foods[f].be();
        foods[f].display();
        if(foods[f].getEnergy() < 0){
          foods[f] = null;
          num_food--;
        }
      }
    }
  }
  
  if(randomPercent <= w.getFoodChance()) {
    foods[num_food] = new Food();
    println("Food: New Food!! energy: " + foods[num_food].getEnergy());
    num_food++;
    created_food++;
  }
  if(randomPercent <= w.getLifeChance()) {
    created_creatures++;
    creatures[num_creatures] = new Creature(w.getDays(), created_creatures); 
    println("Creature: New creature!! max_temp: " + creatures[num_creatures].getMaxTemp() + " min_temp:"+creatures[num_creatures].getMinTemp());
    num_creatures++;
  }
}

void clearScreen() {
  background(0);
}

void writeLog(Creature creature, String cause) {
  output.println("Day "+ w.getDays()+ "  X "+sun.getX());
  output.println("Type: " + creature.type +" "+ cause);
  output.println("Day of creation: " + creature.day_of_creation);
  output.println("Day: " + w.days);
  output.println("Max temp: " + creature.max_temp );
  output.println("Min temp: " + creature.min_temp );
  output.println("Life span: " + creature.life_span );
  output.println("Energy drain: " + creature.energy_drain );
  output.println("Height: "+ creature.y);
  output.println(" ");
  output.flush(); // Writes the remaining data to the file
}

//void mousePressed() {
//  //numcells = 0;
//  //reset();
  
//  if(mouseX > creatures[])
//}