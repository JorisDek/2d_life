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

  
void setup() {
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
    
    for(int f = 0; f < num_food; f++){
      foods[f].be();
      if(foods[f].getEnergy() < 0) {
        foods[f] = null;
        num_food--;
      }
      
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
    }
    
    for(int c = 0; c < num_creatures; c++){
      if(creatures[c].getMinTemp() < water.getTemp(creatures[c].getY()) && creatures[c].getMaxTemp() > water.getTemp(creatures[c].getY())) {
        creatures[c].display();
        
        
        
        if( mouseX > creatures[c].getX() && mouseX < creatures[c].getX() + 5 && mouseY > creatures[c].getY() && mouseY < creatures[c].getY() + 5) {
          if(mousePressed == true) {
            creatures[c].toggleStats();
          }
        } 
        
        println("Creature: " + creatures[c]+ " max_temp:"+creatures[c].getMaxTemp()+" min_temp:"+creatures[c].getMinTemp());
        
        //if(creatures[c] != creatures[0]){
        //  if(creatures[c - 1] == null) {
        //    creatures[c - 1] = creatures[c];
        //  }
        //}
      } else {
        println("Creature: " + creatures[c] + " is dood. Temperatuur te hoog of te laag.");
        creatures[c] = null; 
        num_creatures--;
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
    }
    if(randomPercent <= w.getFoodChance()) {
      foods[num_food] = new Food();
      println("Food: New Food!! energy: " + foods[num_food].getEnergy());
      num_food++;
      created_food++;
    }
    if(randomPercent <= w.getLifeChance()) {
      creatures[num_creatures] = new Creature(w.getDays()); 
      println("Creature: New creature!! max_temp: " + creatures[num_creatures].getMaxTemp() + " min_temp:"+creatures[num_creatures].getMinTemp());
      num_creatures++;
      created_creatures++;
    }
    
    
}

void clearScreen() {
  background(0);
}

//void mousePressed() {
//  //numcells = 0;
//  //reset();
  
//  if(mouseX > creatures[])
//}