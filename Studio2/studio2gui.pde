// Written by Andy Modla

int black = color(0);   // black
int gray = color(128);
int white = color(255); // white
int red = color(255, 0, 0);
int aqua = color(128, 0, 128);
int lightblue = color(64, 64, 128);
int darkblue = color(32, 32, 64);
int yellow = color(255, 204, 0);
int silver = color(193, 194, 186);
int brown = color(69, 66, 61);
int bague = color(183, 180, 139);

int FONT_SIZE = 48;
int BASE_FONT_SIZE = 48;

int KEY_WIDTH;
int KEY_HEIGHT;
int KEY_HSPACING;
int KEY_VSPACING;

boolean displayUpdate = false;

class Key {
  int x, y, w, h;
  String cap;
  int fontSize;

  public Key() {
  }

  public Key(String cap, int fontSize, int x, int y, int w, int h) {
    this.cap = cap;
    this.fontSize = fontSize;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  public void draw() {
    setTextSize(fontSize);
    fill(brown);
    rect(x, y, w, h, w/4);
    fill(white);

    textAlign(CENTER, CENTER);
    text(cap, x, y, w, h );
  }

  public boolean isPressed(int mx, int my) {
    boolean hit = false;
    if (my >= y && my <= (y + h)
      && mx >= x && mx <= (x + w)) {
      hit = true;
    }
    return hit;
  }

  public int getPressed(int mx, int my, int n) {
    boolean hit = false;
    int area = 0;
    if (my >= y && my <= (y + h)) {
      for (int i=1; i<=n; i++) {
        if (mx >= x && mx <= (x + i*w/n)) {
          hit = true;
          area = i;
          break;
        }
      }
    }
    return area;
  }

  public void setCap(String cap) {
    this.cap = cap;
  }
}

class Cartridge extends Key {
  public Cartridge(String cap, int fontSize, int x, int y, int w, int h) {
    setCap(cap);
    this.fontSize = fontSize;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  public void setCap(String cap) {
    this.cap = "<-"+cap + "->";
  }
}

class Keyboard {
  Key[] list = new Key[10];
  int fontSize;
  String[] cap = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
  String label;
  int x, y;
  int keyw, keyh, vSpacing, hSpacing;

  public Keyboard() {
  }

  public Keyboard(String label, int x, int y, int keyw, int keyh, int hSpacing, int vSpacing ) {
    this.x = x;
    this.y = y;
    this.label = label;
    this.keyw = keyw;
    this.keyh = keyh;
    this.hSpacing = hSpacing;
    this.vSpacing = vSpacing;

    for (int i=1; i<list.length; i++) {
      list[i] = new Key(cap[i], fontSize, x+((i-1)%3)*(hSpacing+keyw), y+((i-1)/3)*(vSpacing+keyh), keyw, keyh);
    }
    list[0] = new Key(cap[0], fontSize, x+keyw+hSpacing, y+3*(keyh+vSpacing), keyw, keyh);
  }

  public void draw() {
    // keyboard outline
    fill(silver);
    stroke(brown);
    strokeWeight(4);
    rect(x - hSpacing/2, y - vSpacing/2, 3*(keyw+hSpacing), 4*(keyh+vSpacing), 3*(keyw+hSpacing)/8);
    // keyboard label
    //noStroke();
    //fill(bague);
    //rect(x + keyw + hSpacing, y-3*vSpacing, keyw, keyh);
    noStroke();
    fill(white);
    textAlign(CENTER, CENTER);
    text(label, x + keyw + hSpacing, y-6*vSpacing, keyw, keyh);
    // keyboard
    for (int i=0; i< list.length; i++) {
      list[i].draw();
    }
  }

  public int getPressed( int x, int y) {
    int pressed = -1;
    for (int i=0; i<list.length; i++) {
      if (list[i].isPressed(x, y)) {
        pressed = i;
        break;
      }
    }
    return pressed;
  }
}

Keyboard aKeyboard;
Keyboard bKeyboard;
Key resetKey;
Cartridge cartridge;

private void drawSetup() {
  //println("width="+width + " height="+height);

  KEY_WIDTH = width/8;
  KEY_HEIGHT = KEY_WIDTH;

  KEY_HSPACING = width/50;
  KEY_VSPACING = KEY_HSPACING;

  if (width < 720)
    FONT_SIZE = BASE_FONT_SIZE;
  else
    FONT_SIZE = BASE_FONT_SIZE * (width / 720);
    
  int vertOffset = height/3  +2*KEY_VSPACING;
  aKeyboard = new Keyboard("A", 3*KEY_HSPACING, vertOffset + KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);
  bKeyboard = new Keyboard("B", width/2+KEY_HSPACING, vertOffset+ KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);

  resetKey = new Key("CLEAR", FONT_SIZE, width/2 - width/6, vertOffset + 6*(KEY_HEIGHT)+KEY_VSPACING, 2*KEY_WIDTH + KEY_WIDTH/2, 2*KEY_HEIGHT/3);
  cartridge = new Cartridge(gameTitle[gameSelected], FONT_SIZE, width-8*KEY_WIDTH, vertOffset, 8*KEY_WIDTH, 5*KEY_HEIGHT/6);
}

public void drawKeyboards() {
  setTextSize(FONT_SIZE);
  aKeyboard.draw();
  bKeyboard.draw();
  resetKey.draw();
  cartridge.draw();
}

private void setTextSize(float size) {
  if (size <= 0)
    return;
  textSize(size);
}

public void drawConsole() {
  background(bague);
  drawSetup();
  setTextSize(FONT_SIZE);
  stroke(255);

  // common screen elements
  fill(gray);
  stroke(0);
  fill(lightblue);
  drawKeyboards();
}

public void mouseReleased() {
  clearAllKeys();
}

public void mousePressed() {
  int key = -1;
  String side = "A";
  key = aKeyboard.getPressed(mouseX, mouseY);
  if (key >= 0) {
    isPressedA[key] = 1;
    //println("Keyboard "+side + "="+key);
    return;
  }
  side = "B";
  key = bKeyboard.getPressed(mouseX, mouseY);
  if (key >= 0) {
    isPressedB[key] = 1;
    //println("Keyboard "+side + "="+key);
    return;
  }

  // common areas 
  if (resetKey.isPressed(mouseX, mouseY)) {
    systemReset();
    //println("reset");
    return;
  }
  key = cartridge.getPressed(mouseX, mouseY, 2);
  if (key == 2) {
    gameSelected++;
    if (gameSelected >= gameTitle.length) {
      gameSelected = 0;
    }
    cartridge.setCap(gameTitle[gameSelected]);
    displayUpdate = true;
  } else if (key == 1) {
    gameSelected--;
    if (gameSelected < 0) {
      gameSelected = gameTitle.length-1;
    }
    cartridge.setCap(gameTitle[gameSelected]);
    displayUpdate = true;
  }
}

void updateGUI() {
  // update display each frame
  if (displayUpdate) {
    cartridge.draw();
    displayUpdate = false;
  }
}