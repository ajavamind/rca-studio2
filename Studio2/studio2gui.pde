/*
Note: this license does not apply to  the Studio 2 ROM or game images, nor the RCA Databooks and Datasheets. 
The License applies to the new work only.

MIT License

Copyright (c) 2017-2018 Andrew Modla

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/


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
boolean resetUpdate = false;
boolean displayInfo = false;

static String[] textInfo;

class Key {
  int x, y, w, h; // location
  String cap;     // caption
  int value;
  int fontSize;

  public Key() {
  }

  public Key(int value, String cap, int fontSize, int x, int y, int w, int h) {
    this.value = value;
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
    int area = 0;
    if (my >= y && my <= (y + h)) {
      for (int i=1; i<=n; i++) {
        if (mx >= x && mx <= (x + i*w/n)) {
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

  public void setValue(int value) {
    this.value = value;
  }

  public int getValue() {
    return value;
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
    this.cap = ""+cap + "";
  }
}


class Keyboard {
  Key[] list;
  int fontSize;
  private final String[] cap = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"};
  private final String[] sym = {"\u25CF", "\u21E7", "\u21E6", "\u21E9", "\u21E8"};
  String label;
  int x, y;
  int keyw, keyh, vSpacing, hSpacing;

  public Keyboard() {
  }

  public Keyboard(int numKeys, String label, int x, int y, int keyw, int keyh, int hSpacing, int vSpacing ) {
    list = new Key[numKeys];
    this.x = x;
    this.y = y;
    this.label = label;
    this.keyw = keyw;
    this.keyh = keyh;
    this.hSpacing = hSpacing;
    this.vSpacing = vSpacing;

    if (numKeys == 5) {
      int i = 2;
      list[0] = new Key(2, sym[1], fontSize, x+((i-1)%3)*(hSpacing+keyw), y+((i-1)/3)*(vSpacing+keyh), keyw, keyh);
      i = 4;
      list[1] = new Key(4, sym[2], fontSize, x+((i-1)%3)*(hSpacing+keyw), y+((i-1)/3)*(vSpacing+keyh), keyw, keyh);
      i = 8;
      list[2] = new Key(8, sym[3], fontSize, x+((i-1)%3)*(hSpacing+keyw), y+((i-1)/3)*(vSpacing+keyh), keyw, keyh);
      i = 6;
      list[3] = new Key(6, sym[4], fontSize, x+((i-1)%3)*(hSpacing+keyw), y+((i-1)/3)*(vSpacing+keyh), keyw, keyh);
      i = 5;
      list[4] = new Key(5, sym[0], fontSize, x+((i-1)%3)*(hSpacing+keyw), y+((i-1)/3)*(vSpacing+keyh), keyw, keyh);
    } else if (numKeys >= 10) {
      for (int i=1; i<list.length; i++) {
        list[i] = new Key(i, cap[i], fontSize, x+((i-1)%3)*(hSpacing+keyw), y+((i-1)/3)*(vSpacing+keyh), keyw, keyh);
      }
      list[0] = new Key(0, cap[0], fontSize, x+keyw+hSpacing, y+3*(keyh+vSpacing), keyw, keyh);
      if (numKeys == 16) {
        list[10] = new Key(10, cap[10], fontSize, x, y+3*(keyh+vSpacing), keyw, keyh);
        list[11] = new Key(11, cap[11], fontSize, x+2*(keyw+hSpacing), y+3*(keyh+vSpacing), keyw, keyh);
        list[12] = new Key(12, cap[12], fontSize, x+3*(keyw+hSpacing), y, keyw, keyh);
        list[13] = new Key(13, cap[13], fontSize, x+3*(keyw+hSpacing), y+1*(keyh+vSpacing), keyw, keyh);
        list[14] = new Key(14, cap[14], fontSize, x+3*(keyw+hSpacing), y+2*(keyh+vSpacing), keyw, keyh);
        list[15] = new Key(15, cap[15], fontSize, x+3*(keyw+hSpacing), y+3*(keyh+vSpacing), keyw, keyh);
      }
    }
  }

  public void draw() {
    // keyboard outline
    fill(silver);
    stroke(brown);
    strokeWeight(4);
    if (list.length == 10 || list.length == 5) {
      rect(x - hSpacing/2, y - vSpacing/2, 3*(keyw+hSpacing), 4*(keyh+vSpacing), 3*(keyw+hSpacing)/8);
    } else if (list.length == 16) {
      rect(x - hSpacing/2, y - vSpacing/2, 4*(keyw+hSpacing), 4*(keyh+vSpacing), 4*(keyw+hSpacing)/8);
    }
    // keyboard label
    noStroke();
    fill(white);
    textAlign(CENTER, CENTER);
    if (list.length == 10 || list.length == 5) {
      text(label, x + keyw + hSpacing, y-6*vSpacing, keyw, keyh);
    } else {
      text(label, x + 2*keyw -hSpacing, y-6*vSpacing, keyw, keyh);
    }
    // keyboard
    for (int i=0; i< list.length; i++) {
      //if (list[i] != null)
        list[i].draw();
    }
  }

  public int getPressed( int x, int y) {
    int pressed = -1;
    for (int i=0; i<list.length; i++) {
      //if (list[i] != null) {
        if (list[i].isPressed(x, y)) {
          pressed = list[i].getValue();
          break;
        //}
      }
    }
    return pressed;
  }
}

Keyboard aKeyboard;
Keyboard bKeyboard;
Key resetKey;
Cartridge cartridge;
Key coinKey;
Key infoKey;

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
  if (console == STUDIO2 || console == STUDIO3) {
    aKeyboard = new Keyboard(10, "A", 3*KEY_HSPACING, vertOffset + KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);
    bKeyboard = new Keyboard(10, "B", width/2+KEY_HSPACING, vertOffset+ KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);
  } else if (console == ARCADE) {
    aKeyboard = new Keyboard(5, "A", 3*KEY_HSPACING, vertOffset + KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);
    bKeyboard = new Keyboard(5, "B", width/2+KEY_HSPACING, vertOffset+ KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);
  } else if (console == CUSTOM) {
    aKeyboard = new Keyboard(5, "A", 3*KEY_HSPACING, vertOffset + KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);
    bKeyboard = new Keyboard(5, "B", width/2+KEY_HSPACING, vertOffset+ KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);
  } else {
    aKeyboard = new Keyboard(16, "VIP", 11*KEY_HSPACING, vertOffset + KEY_HEIGHT+3*KEY_VSPACING, KEY_WIDTH, KEY_HEIGHT, KEY_HSPACING, KEY_VSPACING);
    bKeyboard = null;
  }
  resetKey = new Key(0, "CLEAR", FONT_SIZE, width/2 - width/6, vertOffset + 6*(KEY_HEIGHT)+KEY_VSPACING, 2*KEY_WIDTH + KEY_WIDTH/2, 2*KEY_HEIGHT/3);
  cartridge = new Cartridge(gameTitle[gameSelected], FONT_SIZE, width-8*KEY_WIDTH, vertOffset, 8*KEY_WIDTH, 5*KEY_HEIGHT/6);
  coinKey = new Key(0, "25\u00A2", FONT_SIZE, width/16, vertOffset + 6*(KEY_HEIGHT)+KEY_VSPACING, KEY_WIDTH + KEY_WIDTH/2, 2*KEY_HEIGHT/3);
  infoKey = new Key(0, "?", FONT_SIZE, 12*width/16, vertOffset + 6*(KEY_HEIGHT)+KEY_VSPACING, KEY_WIDTH + KEY_WIDTH/2, 2*KEY_HEIGHT/3);
}

public void drawKeyboards() {
  setTextSize(FONT_SIZE);
  if (aKeyboard != null) {
    aKeyboard.draw();
  }
  if (bKeyboard != null) {
    bKeyboard.draw();
  }
  resetKey.draw();
  cartridge.draw();
  infoKey.draw();
  if (console == ARCADE) {
    coinKey.draw();
  }
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
  if (aKeyboard != null) {
    key = aKeyboard.getPressed(mouseX, mouseY);
    if (key >= 0) {
      isPressedA[key] = 1;
      //println("Keyboard A="+key);
      return;
    }
  }
  if (bKeyboard != null) {
    key = bKeyboard.getPressed(mouseX, mouseY);
    if (key >= 0) {
      isPressedB[key] = 1;
      //println("Keyboard B="+key);
      return;
    }
  }
  // common areas 
  if (resetKey.isPressed(mouseX, mouseY)) {
    resetUpdate = true;
    systemReset();
    println("reset");
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
    return;
  } else if (key == 1) {
    gameSelected--;
    if (gameSelected < 0) {
      gameSelected = gameTitle.length-1;
    }
    cartridge.setCap(gameTitle[gameSelected]);
    displayUpdate = true;
    return;
  }
  if (console == ARCADE) {
    if (coinKey.isPressed(mouseX, mouseY)) {
      coin = true;
    }
    return;
  }
  if (infoKey.isPressed(mouseX, mouseY)) {
    displayInfo ^= true;
    return;
  }
}

void updateGUI() {
  // update display each frame
  if (resetUpdate) {
    drawConsole();
    resetUpdate = false;
  }
  if (displayUpdate) {
    cartridge.draw();
    displayUpdate = false;
  }
}