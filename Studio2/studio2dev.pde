//
// Note: this license does not apply to  the Studio 2 ROM or game images, nor the RCA Databooks and Datasheets. 
// The License applies to the new work only.

// MIT License
//
// Copyright (c) 2017-2018 Andrew Modla
// portions Copyright (c) 2016 paulscottrobson
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

/**
 * Written by Andrew Modla
 * Derived from Arduino version of Studio 2 from C code written by Paul Robson March 2013
 * Sections ported to Processing 
 *
 */

static volatile int toneState = 0;                           // Tone currently on/off
static volatile int toneTimer;                               // No of syncs tone has been on.
static int BEEP_FREQUENCY  = 625; // Studio 2 default

int saveCounter = 0; // save screen filename counter

// *****************************************************************************************************************
//										          Keypad configuration emulation
// A keypad (left)
// B keypad (right)
// *****************************************************************************************************************
volatile static int isPressedA[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };              // Flags for each key pressed.
volatile static int isPressedB[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };              // Flags for each key pressed.

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
 * Decode keys for console play
 * Debug keys for displaying frame rate, system reset, and screen save, etc.
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
          screenSave = true;
        } else if (key == 'c' || key == 'C') {
          // Insert Coin for Arcade Game
          println("Coin");
          coin = true;
        } else if (key == ' ') { 
          step = true;  // not implemented
        //} else if (key == 't' || key == 'T') {  // test interrupt
        //  if (READ(R[P]) == 0) {
        //    R[P]++;        
        //    R[P] &= 0xFFFF;
        //  }
        //  // Come out of IDL for Interrupt.
        //  INTERRUPT();  // if IE != 0 generate an interrupt.
        } else if (key == 'd' || key == 'D') {
          debugInfo();
        } else if(key == 'p' || key == 'P') { // parameter on/off
          if (COIN_ARCADE_PARAMETER_SWITCH == 0)
            COIN_ARCADE_PARAMETER_SWITCH = 8;
          else
            COIN_ARCADE_PARAMETER_SWITCH = 0;
          println("COIN_ARCADE_PARAMETER_SWITCH="+COIN_ARCADE_PARAMETER_SWITCH);
        }
      }
    }
  }
}

void debugInfo() {
  println("screenEnabled="+screenEnabled);
  println("P="+ hexData(P) +" X="+ hexData(X) + " R[X]="+hex(R[X]) + " IE=" +IE + " Q="+ Q +" state="+state + " cycles="+cycles + " coin="+coin);
  println(" R[0]="+hex(R[0])+" R[1]="+hex(R[1]) +" R[2]="+hex(R[2]) +" R[3]="+hex(R[3]));
  println(" R[4]="+hex(R[4])+" R[5]="+hex(R[5]) +" R[6]="+hex(R[6]) +" R[7]="+hex(R[7]));
  println(" R[8]="+hex(R[8])+" R[9]="+hex(R[9]) +" R[10]="+hex(R[10]) +" R[11]="+hex(R[11]));
  println(" R[12]="+hex(R[12])+" R[13]="+hex(R[13]) +" R[14]="+hex(R[14]) +" R[15]="+hex(R[15]));
  //println(" screenMemory="+hex(screenMemory) );
}

// *****************************************************************************************************************
//												Hardware Interface
// *****************************************************************************************************************

static volatile int selectedKeypad = 1;                          // Currently selected keypad

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

static int SYSTEM_Command(int cmd, int param)
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
      if (toneState != 0) {
        //tone(true); 
        //print("Q=1");
      } else {
        //tone(false);					// and set the beeper accordingly.
        //print("Q=0");
      }
      toneTimer = 0;
    } 																		// 2,945 Hz is from CCT Diagram values on
    break;    																// NE555V in RCA Cosmac VIP.

  case  2: //HWC_FRAMESYNC:
    displayPointer = CPU_GetScreenMemoryAddress();            // Set the display pointer to "whatever it is"
    scrollOffset = CPU_GetScreenScrollOffset();              // Set the current scrolling offset.
    if (toneState != 0 && toneTimer != 25) 
    {
      toneTimer++;
      //if ((toneTimer & 1) == 0) tone(BEEP_FREQUENCY-toneTimer*4);
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
 * Display the video display screen 64x32 pixels
 * Implements color for Studio III emulation
 */
private static final int VIDEO_SCREEN_WIDTH = 64;  // pixels
private static final int VIDEO_SCREEN_HEIGHT = 32; // pixels
void displayScreen(boolean isDebugMode, int screenWidth, int screenHeight, int displayData, int scrollOffset, int displaySize)
{
  int xc, yc, xs, ys, x, y, pixByte;
  int rx, ry, rw, rh;   // defines drawing rectangle coorinates
  int drawWidth;
  int drawHeight;
  int hOffset;
  int pages = displaySize/256;
  if (pages == 0)
    pages = 1;
  int mask = displaySize-1;
  int displayHeight = pages * VIDEO_SCREEN_HEIGHT;
  
  drawWidth = screenWidth - screenWidth/16;
  drawHeight = screenHeight - screenHeight/8;
  xs = drawWidth / (VIDEO_SCREEN_WIDTH + 2);  // pixel width
  ys = xs/pages;  // pixel height
  hOffset = (screenWidth - 64*xs)/2;
  xc = xs; //0;
  yc = ys; //0;
  rx = xc;
  ry = yc;
  // Erase screen display
  fill(bgColor[backgroundColor]);
  rect(0, 0, screenWidth, screenHeight - 2*ys);
  if (displayData == -1) {
    //println("screen OFF");
    return; // Screen off, exit.
  }
  //println("screen ON");
  color fgr = WHITE;       // Painting color.
  if (isDebugMode)
    stroke(color(255, 0, 0));  // debug outline
  else 
    noStroke();

  fill(fgr);
  rw = xs;
  rh = ys;                  // Set cell width and height
  for (y = 0; y < displayHeight; y++)                               // One line at a time.
  {
    int offset = ((y * 8 + scrollOffset) & mask);                   // Work out where data comes from.
    ry = yc + ys * y;                                               // Calculate vertical coordinate
    xc = 0;
    for (x = 0; x < (VIDEO_SCREEN_WIDTH/8); x++)                    // 8 bytes per line.
    {
      pixByte = studio2_memory[(displayData+offset)& 0xFFFF] & 0xFF;   // Get next 8 pixels
      offset++;
      rx = xc + x * xs * 8;                                         // Calculate horizontal coordinate
      if (console == STUDIO3 || (console == VIP && interpreter == CHIP8X)) {
        int colorIndex = studio2_memory[COLOR_MAP + x + 8*(y/4)] & 0x0007;
        fill(colorMap[colorIndex]);
      }
      while (pixByte != 0)                                          // if something to render.
      {
        // if bit 7 set draw pixel
        if ((pixByte & 0x80) != 0) {
          rect(hOffset+rx, ry, rw, rh);                             // draw rectangle when pixel set
        }
        pixByte = (pixByte << 1) & 0xFF;                            // shift to left, lose overflow.
        rx = rx + xs;                                               // next coordinate across.
      }
    }
  }
}

/**
 * Display the information text
 */
void displayInfo(int screenWidth, int screenHeight, String[] text, int offset)
{
  int x, y;
  int drawWidth;
  int drawHeight;
  
  if (text.length == 0)
    return;
    
  int end = TEXT_PAGE_SIZE;

  if (offset >= TEXT_PAGE_SIZE)
    end = offset + TEXT_PAGE_SIZE;
  if (end > text.length)
    end = text.length;
  drawWidth = screenWidth;
  drawHeight = screenHeight - screenHeight/8;
  x = 10;
  y = 50;
  
  // Erase screen display
  fill(128);
  rect(0, 0, drawWidth, drawHeight);
  setTextSize(FONT_SIZE/2); //<>// //<>//
  fill(BLACK);
  textAlign(LEFT, BASELINE);
  //println("offset="+offset + " end="+end);
  for (int i=offset; i<end; i++) {
    text(text[i], x, y );
    y += 50;
  }
  
}

/**
 * Load Game Cartridge Binary
 * param fileName String for files located in "data" folder
 */
void loadGameBinary(String fileName)
{
  println("Filename: "+fileName);
  int address;
  byte[] data = loadBytes(fileName);
  
  // Decode file type to process contents of file
  if (fileName.toLowerCase().endsWith(".st2")) { // Studio 2 Cartridge file
    String header="";
    try {
      header = new String(data, "UTF8");
    }
    catch (UnsupportedEncodingException e)
    {
      header = "invalid";
      println("Unsupported ASCII encoding");
    }
    if (!(header.startsWith("RCA2") && data[5] == 1)) { 
      println("Invalid Studio 2 Game Cartridge file");
      return;
    }
    int blocks = data[4];
    //println("blocks="+blocks);
    //println("ROM Size "+(blocks-1)*256 +" bytes");
    blocks--;
    for (int i = 0; i< blocks; i++) {
      int page = data[64+i];
      if (page != 0) {
        address = page << 8;
        //println("address="+hex(address));
        for (int j=0; j<256; j++) {
          if (address < RAM || address >= (RAM+RAM_SIZE)) {
            studio2_memory[address+j] = data[256*(i+1) + j] & 0xFF;
          }
        }
      }
    }
  }
  // .BIN binary file
  else if (fileName.toLowerCase().endsWith(".bin")) { // Studio 2 Cartridge file binary format
    address = 0x0400; // Interpreter code game starting location
    for (int i=0; i<data.length; i++) {
      if (address < RAM || address >= (RAM+RAM_SIZE)) {
        studio2_memory[address] = data[i] & 0xFF;
      }
      address++;
    }
  }
  // .CH8 binary file
  else if (fileName.toLowerCase().endsWith(".ch8")) { // Chip8 file binary format
    address = 0x0200; // Program code starting location
    for (int i=0; i<data.length; i++) {
      if (address < RAM || address >= (RAM+RAM_SIZE)) {
        studio2_memory[address] = data[i] & 0xFF;
        //println(" " + hex(address) + " " + hex(int(data[i])));
      }
      address++;
    }
  }
  // .C8X binary file
  else if (fileName.toLowerCase().endsWith(".c8x")) { // Chip8X file binary format
    address = 0x0300; // Program code starting location
    for (int i=0; i<data.length; i++) {
      if (address < RAM || address >= (RAM+RAM_SIZE)) {
        studio2_memory[address] = data[i] & 0xFF;
        //println(" " + hex(address) + " " + hex(int(data[i])));
      }
      address++;
    }
  }
  // .VIP binary file
  else if (fileName.toLowerCase().endsWith(".vip")) { // VIP file binary format
    address = 0x0000; // Program code starting location
    for (int i=0; i<data.length; i++) {
      if (address < RAM || address >= (RAM+RAM_SIZE)) {
        studio2_memory[address] = data[i] & 0xFF;
        //println(" " + hex(address) + " " + hex(int(data[i])));
      }
      address++;
    }
  }
  // .ARC binary file for Arcade Game consoles
  else if (fileName.toLowerCase().endsWith(".arc")) { 
    address = 0x0000;
    for (int i=0; i<data.length; i++) {
      if (!((address >= RAM && address < (RAM+RAM_SIZE)))) {
        studio2_memory[address] = data[i] & 0xFF;
      }
      address++;
    }
  }
  // .FD2 binary file for RCA COSMAC FRED 2 Game Systems
  else if (fileName.toLowerCase().endsWith(".fd2")) { 
    address = 0x0000;
    for (int i=0; i<data.length; i++) {
      if (!((address >= RAM && address < (RAM+RAM_SIZE)))) {
        studio2_memory[address] = data[i] & 0xFF;
      }
      address++;
    }
  }
  // .CUS binary file testing consoles
  else if (fileName.toLowerCase().endsWith(".cus")) { 
    address = 0x0000;
    for (int i=0; i<data.length; i++) {
      if (!((address >= RAM && address < (RAM+RAM_SIZE)))) {
        studio2_memory[address] = data[i] & 0xFF;
      }
      address++;
    }
  }
  // .ROM binary file for Studio consoles
  else { 
    address = 0x0000;
    for (int i=0; i<data.length; i++) {
      if (console == CUSTOM) {
        studio2_memory[address] = data[i] & 0xFF;
      } else {
        if (!((address >= RAM && address < (RAM+RAM_SIZE)) || 
          (address >= COLOR_MAP && address < (COLOR_MAP+COLOR_MAP_SIZE))) ) {
          studio2_memory[address] = data[i] & 0xFF;
        }
      }
      address++;
    }
  }
}

/**
 * Load Binary Memory Image
 * param fileName String for files located in "data" folder
 * param address Location in RAM
 */
void loadBinary(String fileName, int address)
{
  println("Binary Filename: "+fileName + " at "+ hex(address));
  byte[] data = loadBytes(fileName);
  // binary file
  for (int i=0; i<data.length; i++) {
    studio2_memory[address] = data[i] & 0xFF;
    //println(" " + hex(address) + " " + hex(int(data[i])));
    address++;
  }
}

/**
 * Load Game Info Text String
 * param fileName String for files located in "data" folder
 */
void loadGameInfo(String fileName)
{
  println("Info Filename: "+fileName);
  textInfo = loadStrings(fileName);
  //if (textInfo != null && textInfo.length > 0) {
  //  for (int i=0; i< textInfo.length; i++) {
  //    println(textInfo[i]);
  //  }
  //} else {
  //  println("missing info file");
  //}
}