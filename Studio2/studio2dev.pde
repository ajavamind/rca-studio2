// *****************************************************************************************************************
// *****************************************************************************************************************
//
//								    	  Derived from Arduino version of Studio 2
//
//										 Written by Paul Robson March 2013
//

/**
 * Written by Andy Modla or converted from code written by Paul Robson
 *
 */
 
class Rect {
  int x;
  int y;
  int w;
  int h;

  public Rect() {
  }
  public Rect(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
}

int saveCounter = 0;

// *****************************************************************************************************************
//										          Keypad configuration emulation
// A keypad (left)
// B keypad (right)
// *****************************************************************************************************************
volatile int isPressedA[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };              // Flags for each key pressed.
volatile int isPressedB[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };              // Flags for each key pressed.

/**
 *
 * Clear simulated key press arrays
 */
void clearAllKeys() {
  for (int i=0; i<16; i++) {
    isPressedA[i] = 0;
    isPressedB[i] = 0;
  }
}

/**
 * Check for key presses.
 * Decode keys
 * Debug keys for displaying frame rate, system reset, and screen save
 */
void checkAllKeys() 
{
  int x;
  if (keyPressed) {
    // A keyboard: 0-9 keys 
    x = keyCode-48;
    if (x <=9 && x >=0) {
      isPressedA[x] = 1;
      //println(keyCode);
    } else { 
      // B keyboard: numeric (numlock) keypad 0-9 keys
      x = keyCode-96;
      if (x <=9 && x >=0) {
        isPressedB[x] = 1;
        //println(keyCode);
      } 
      // Keys for Debug
      else { 
        // Show frame rate
        if (key == 'f' || key == 'F') {
          println("frameRate="+frameRate);
        } 
        // System reset
        else if (key == 'r' || key == 'R') {
          println("System Reset");
          systemReset();
        }
        // save screen shot
        else if (key == 's' || key == 'S') {
          save("screenshot/screen"+saveCounter+".png");
          println("Save Screenshot "+"screen+"+saveCounter+".png");
          saveCounter++;
        }
      }
    }
  }
}


// *****************************************************************************************************************
//												Hardware Interface
// *****************************************************************************************************************

static int toneState = 0;															// Tone currently on/off ?
static int toneTimer; 															// No of syncs tone has been on.
static int BEEPFREQUENCY  = 625;

void tone(int val) {
}

static int selectedKeypad = 1;                          // Currently selected keypad

void keyPressed() {
  //println("press key="+key);
  //println("keyCode="+keyCode);
  checkAllKeys();
}
void keyReleased() {
  //println("release key="+key);
  //println("keyCode="+keyCode);
  clearAllKeys();
}

int SYSTEM_Command(int cmd, int param)
{
  int retVal = 0;
  switch(cmd)
  {
  case  0: //HWC_READKEYBOARD:														// Read the keypad 
    if (selectedKeypad == 1) {
      retVal = isPressedA[param & 0x0F];
    }			
    else if (selectedKeypad == 2) {
      retVal = isPressedB[param & 0x0F];
    }
    break;    

  case  1: //HWC_UPDATEQ:             
    if (param != toneState) 												// Has it changed state ?
    {
      toneState = param;													// If so save new state
      if (toneState != 0) 
        tone(BEEPFREQUENCY); 
      else 
      tone(0);					// and set the beeper accordingly.
      toneTimer = 0;
    } 																		// 2,945 Hz is from CCT Diagram values on
    break;    																// NE555V in RCA Cosmac VIP.

  case  2: //HWC_FRAMESYNC:
    displayPointer = CPU_GetScreenMemoryAddress();            // Set the display pointer to "whatever it is"
    scrollOffset = CPU_GetScreenScrollOffset();              // Set the current scrolling offset.
    if (toneState != 0 && toneTimer != 25) 
    {
      toneTimer++;
      if ((toneTimer & 1) == 0) tone(625-toneTimer*4);
    }
    //CheckAllKeys();															// Rescan the keyboard.
    break;    

  case 3: //HWC_SETKEYPAD:															// Studio 2 has two keypads, this chooses the
    selectedKeypad = param;													// currently selected one (for HWC_READKEYBOARD)
    break;																	// Not fully implemented here :)
  }
  return retVal;
}

/**
 * Display the pixel screen 64x32
 * Implements color for Studio III emulation
 */
void displayScreen(boolean isDebugMode, int screenData, int scrollOffset)
{
  int xc, yc, xs, ys, x, y, pixByte;
  Rect rc = new Rect();
  xc = 0;
  yc = 0;
  xs = width / 64;  // program screen size() width
  ys = height / 32;  // program screen size() height
  rc.x = xc;
  rc.y = yc;
  // Erase screen display
  background(bgColor[backgroundColor]);
  if (screenData == -1) {
    //println("screen OFF");
    return; // Screen off, exit.
  }
  //println("screen ON");
  color fgr = WHITE;       // Painting colour.
  if (isDebugMode)
    stroke(color(255, 0, 0));  // debug outline
  else 
  noStroke();

  fill(fgr);
  rc.w = xs;
  rc.h = ys;                                                                // Set cell width and height
  for (y = 0; y < 32; y++)                                                              // One line at a time.
  {
    int offset = ((y * 8 + scrollOffset) & 0xFF);                   // Work out where data comes from.
    rc.y = yc + ys * y;                                                             // Calculate vertical coordinate
    xc = 0;
    for (x = 0; x < 8; x++)                                                           // 8 bytes per line.
    {
      pixByte = studio2_4k[screenData+offset++] & 0xFF;                            // Get next pixel.
      rc.x = xc + x * xs * 8;                                                     // Calculate horizontal coordinate
      if (console == STUDIO3) {
        int colorIndex = studio2_4k[COLOR_MAP + x + 8*(y/4)] & 0x0007;
        fill(colorMap[colorIndex]);
      }
      while (pixByte != 0)                                                        // if something to render.
      {
        // if bit 7 set draw pixel
        if ((pixByte & 0x80) != 0) {
          rect(rc.x, rc.y, rc.w, rc.h);
        }
        pixByte = (pixByte << 1) & 0xFF;                                        // shift to left, lose overflow.
        rc.x = rc.x + xs;                                                       // next coordinate across.
      }
    }
  }
}

/**
 * Load Game Cartridge Binary
 * param fileName String for files located in "data" folder
 */
void loadGameBinary(String fileName)
{
  int address;
    byte[] data = loadBytes(fileName);
    if (fileName.toLowerCase().endsWith(".st2")) { // Studio 2 Cartridge file
      String header="";
      try {
      header = new String(data, "UTF8");
      }
      catch (UnsupportedEncodingException e)
      {
        header = "invalid";
        println("unsupported ASCII encoding");
      }
      if (!(header.startsWith("RCA2") && data[5] == 1)) { 
        println("Invalid Studio 2 Game Cartridge file");
        return;
      }
      int blocks = data[4];
      //println("blocks="+blocks);
      println("ROM Size "+(blocks-1)*256 +" bytes");
      blocks--;
      for (int i = 0; i< blocks; i++) {
        int page = data[64+i];
        if (page != 0) {
          address = page << 8;
          println("address="+hex(address));
          for (int j=0; j<256; j++) {
            if (address < 0x800 || address >= 0xA00) {
              studio2_4k[address+j] = data[256*(i+1) + j] & 0xFF;
             }
           }
        }
      }
    }
    else { // binary file
    address = 0x400;
    for (int i=0; i<data.length; i++) {
      if (address < 0x800 || address >= 0xA00) {
          studio2_4k[address] = data[i] & 0xFF;
      }
      address++;
    }
    }
}