/* Kevin Ge
This Program will write, save, and load maps through txt documents
This Editor will be used to create collision detection for 2d game maps
*/

boolean[][] colored;
int xRes = 100;
int yRes = 60;
int selection = 1;
int incSize = 1000/100;

String[] line = new String[xRes * yRes];

void setup() {
  size(1000, 600);
  colored = new boolean[xRes][yRes];
  for (int i = 0; i < xRes; i++) {
    for (int j = 0; j < yRes; j++) {
      colored[i][j] = false;
    }
  }
}

void saveMap() {
  int lineLocation = 0;
  for (int i = 0; i < xRes; i++) {
    for (int j = 0; j < yRes; j++) {
      line[lineLocation] = str(colored[i][j]);
      lineLocation++;
    }
  }
  saveStrings("map.txt", line);
}

void loadMap() {
  int lineLocation = 0;
  line = loadStrings("map.txt");
  
  for (int i = 0; i < xRes; i++) {
    for (int j = 0; j < yRes; j++) {
      colored[i][j] = boolean(line[lineLocation]);
      lineLocation++;
    }
  }
}

void draw() {
  background(255);
  drawTile();
  if (mousePressed) {
    testClick();
  }
}

void drawTile() {
  noStroke();
  rectMode(CORNER);
  for (int i = 0; i < xRes; i++) {
    for (int j = 0; j < yRes; j++) {
      if (colored[i][j]) { //if tile is colored, fill black
        fill(0);
      }
      else { //if tile is not colored, no fill
        noFill();
      }
      rect(i * incSize, j * incSize, incSize, incSize);
    }
  }
}

void testClick() {
  for (int i = 0; i < xRes; i++) {
    for (int j = 0; j < yRes; j++) {
      if (selection == 1 && mouseX > i*incSize && mouseX < i*incSize + incSize && 
      mouseY > j*incSize && mouseY < j*incSize + incSize) {
        colored[i][j] = true;
      }
      if (selection == 2 && mouseX > i*incSize && mouseX < i*incSize + incSize && 
      mouseY > j*incSize && mouseY < j*incSize + incSize) {
        colored[i][j] = false;
      }
    }
  }
}

void keyPressed() {
  switch(key) {
    case '1':
      selection = 1;
      System.out.println("DRAW MODE");
      break;
    case '2':
      selection = 2;
      System.out.println("ERASE MODE");
      break;
    case 's':
      saveMap();
      System.out.println("save");
      break;
    case 'l':
      loadMap();
      System.out.println("load");
      break;
    case 'r':
      setup();
      System.out.println("reset");
  }
}
