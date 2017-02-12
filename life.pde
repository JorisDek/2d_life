World w;
int num_creatures = 0;
int max_creatures = 1000;
int created_creatures = 0;

color spore_color;
// set lower for smoother animation, higher for faster simulation
int runs_per_loop = 10000;
color black = color(0, 0, 0);
Air air = new Air();
Water water = new Water();
Sun sun  = new Sun();
Creature[] creatures = new Creature[max_creatures];


  
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
    float randomlife = random(100);
    air.display();
    water.display();
    sun.display();
    sun.move();
    
    fill(240,240,0);
    textSize(18);
    text("Water temp: "+water.getWaterTemp(), 10, 300);
    fill(0);
    textSize(16);
    text("Day: "+w.getDays(), 10, 50);
    text("X: "+sun.getX(), 10, 65);
    text("Created Creatures: "+created_creatures, 10, 80);
    
    
    if(randomlife <= w.getLifeChance()) {
      creatures[num_creatures] = new Creature(w.getDays()); 
      System.out.println("Creature: New creature!! max_temp:"+creatures[num_creatures].getMaxTemp()+" min_temp:"+creatures[num_creatures].getMinTemp());
      num_creatures++;
      created_creatures++;
    }
    for(int i = 0; i < num_creatures; i++){
      if(creatures[i].getMinTemp() < water.getTemp(creatures[i].getY()) && creatures[i].getMaxTemp() > water.getTemp(creatures[i].getY())) {
        creatures[i].display();
        System.out.println(creatures[i]+ " max_temp:"+creatures[i].getMaxTemp()+" min_temp:"+creatures[i].getMinTemp());
      } else {
        System.out.println(creatures[i] + " is dood. Temperatuur te hoog of te laag.");
        creatures[i] = null; 
        num_creatures--;
      }
      
      /* Na 100 dagen in leven
      -- Stage 1 --
      kans om te zwemmen of kans op temp aanpassing aan de hand van average
      -- Stage 2 --
      kans om temp te noticen
      -- Stage 3 --
      ??
      ---- Stat increases -----
      */
    }
    
}

void clearScreen() {
  background(0);
}

void mousePressed() {
  //numcells = 0;
  reset();
}