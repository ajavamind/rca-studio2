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
 * RCA Studio II and Studio III Video Game Console Emulator
 *
 * Ported to Java/Processing by Andrew Modla
 * from code written in C by Paul Scott Robson.
 *
 * https://github.com/paulscottrobson/studio2-games
 *
 * Studio 2 emulation: black and white graphics, single tone sound
 * Studio 3 emulation: color graphics, color background, and
 * programmable sound tone generator
 * VIP computer board emulation
 * RCA Arcade game emulation
 */

private static boolean test = false;  // run test components
private static boolean sound = true; // control sound on/off
private static boolean android = false;
private static boolean screenSave = false;
private static boolean doReset = false;

// Microprocessor type
private final static int CDP1800 = 0;  // SYSTEM 00 and FRED I discrete logic architectures
private final static int CDP1801 = 1;
private final static int CDP1802 = 2;
private static int cpu = CDP1802;

// Console or Development Board types
private final static int SYSTEM00 = 0;
private final static int FRED1    = 1;
private final static int FRED2    = 2;
private final static int ARCADE   = 3;
private final static int STUDIO2  = 4;  
private final static int STUDIO3  = 5;  
private final static int VIP      = 6;
private final static int ELF      = 7;
private final static int CUSTOM   = 8;
private static int console = STUDIO2;

// Cartridge Mode
private final static int NORMAL = 0;
private final static int TEST = 1;
private static int cartridgeMode = NORMAL;

// CHIP8 Interpreter types
private final static int ROM_ONLY = 0;  // assumes VIP ROM at 0x8000 but not interpreter
private final static int CHIP8 = 1;
private final static int CHIP8X = 2;
private static int interpreter = CHIP8;

// Background colors
static int backgroundColor = 1; // index for bgColor array selection
static color BLACK_BACKGROUND = 0xFF000000; // color(0);
static color BLUE_BACKGROUND = 0xFF000080;  // color(0, 0, 128);
static color GREEN_BACKGROUND = 0xFF008000; // color(0, 128, 0);
static color RED_BACKGROUND = 0xFF800000;  //color(128, 0, 0);
static color[] bgColor = {BLUE_BACKGROUND, BLACK_BACKGROUND, GREEN_BACKGROUND, RED_BACKGROUND};

// Pixel colors
color BLACK = color(0);
color RED = color (255, 0, 0);
color BLUE = color(0, 0, 255);
color VIOLET = color (255, 0, 255);
color GREEN = color(0, 255, 0);
color YELLOW = color(255, 255, 0);
color AQUA = color(0, 255, 255);
static color WHITE = 0xFFFFFFFF;  // color(255, 255, 255);
color[] colorMap = {BLACK, RED, BLUE, VIOLET, GREEN, YELLOW, AQUA, WHITE};

private final static int INITIAL_COLOR_MAP = 0x0B00;
private static int COLOR_MAP = INITIAL_COLOR_MAP;
private final static int COLOR_MAP_SIZE = 0x40;
private static int INITIAL_RAM = 0x800; // Studio 2 and 3
private static int RAM = INITIAL_RAM; // Studio 2 and 3
private final static int RAM_SIZE = 0x200; // Working and Video display RAM
private static int INITIAL_VIDEO_RAM = 0x900;  // Studio 2 and 3 starting location
private static int VIDEO_RAM = INITIAL_VIDEO_RAM;  // Studio 2 and 3 starting location
// Video RAM is 64 x 32 pixels stored in 256 bytes
private static int DISPLAY_SIZE = 256;

private static int COIN_ARCADE_AD_ROM = 0x0A00;  // splash barker screen
private static int COIN_ARCADE_PARAMETER_SWITCH = 0;   // 8 is test mode?

//////////////////////////////////////////////////////////////

volatile int gameSelected = 0; // Studio II Demo Cartridge

// Game cartridge and information files are in the Processing "data" folder
String[] gameFileName = {
/* 0 */  "RCA_demo.st2", // Studio 2 demo cartridge
  // Studio 2 Resident Games
/* 1 */  "studio2.rom", // Studio 2 internal game ROM with Studio II interpreter
  // Studio 2 game cartridges
/* 2 */  "SPACEWAR.BIN", 
/* 3 */  "fun-with-numbers.st2", 
/* 4 */  "school.st2", 
/* 5 */  "SPEEDWAY.BIN", 
/* 6 */  "TENNIS.BIN", 
/* 7 */  "BASEBALL.BIN", 
/* 8 */  "blackjack.st2", 
/* 9 */  "gunfighter-moonship.bin", 
/* 10 */ "RCA_TEST_CARTRIDGE_TESTER1.st2",

  ////////////////////////////////
/* 11 */  "RCA_demo.st2", // Studio 3 demo cartridge holding entry
  // Studio 3 game cartridges implement with color graphics.
  //The Victory MPT-02, a clone of the RCA Studio III is a videogame console made by Soundic released around 1978. 
  // Unlike the Studio II the Victory came with 2 detachable controllers. 
/* 12 */  "victory.rom", // Victory is a Studio 3 internal resident game ROM
  // Studio 3 game cartridges
/* 13 */  "mathfun.st2", 
/* 14 */  "biorhythm.st2", 
/* 15 */  "pinball.st2", 
/* 16 */  "bingo.st2", 
/* 17 */  "concentration-match.st2", 
/* 18 */  "star-wars.st2", 
  ////////////////////////////////
  // Other Studio2 Games 
/* 19 */  "computer.st2", 
/* 20 */  "hockey.st2", 
/* 21 */  "combat.st2", 
/* 22 */  "Climber.st2", 
/* 23 */  "scramble.st2", 
/* 24 */  "rocket.st2", 
/* 25 */  "outbreak.st2", 
/* 26 */  "pacman.st2", 
/* 27 */  "kaboom.st2", 
/* 28 */  "asteroids.st2", 
/* 29 */  "berzerk.st2", 
/* 30 */  "invaders.st2", 
/* 31 */  "tv-arcade-2012.st2", 
  ////////////////////////////////
  // VIP CHIP8 games 
/* 32 */  "Bowling [Gooitzen van der Wal].ch8", // Chip8 version of J. Weisbecker bowling
/* 33 */  "Blockout [Steve Houk].c8x", // Chip8x 
/* 34 */  "ColourTest.c8x", 
/* 35 */  "Color Kaleidoscope [Steve Houk, 1978].c8x", 
/* 36 */  "swordfighter[Joe Weisbecker].vip", // swordfighter does not use CHIP8
  ////////////////////////////////
  // RCA Video Coin Arcade games (1975 pre-dates Studio 2) 
/* 37 */  "AUD_2464_09_B41_ID01_01 Tag-Bowling.wav.fd2", 
/* 38 */  "AUD_2464_09_B41_ID02_01 Coin Bowling.wav.arc",
/* 39 */  "AUD_2464_09_B41_ID01_02 Swords.wav.arc", 
  ////////////////////////////////
  // Test area
/* 40 */ //"S.572.2 VIP special-1_of_5.wav.vip",
/* 41 */ ///"S.572_16_of_16.wav.raw.vip",
};

String[] gameTitle = {
  "RCA Studio 2 Demo",
  "Studio2 Resident Games", // Studio 2 resident games: Doodle/Patterns/Bowling/Freeway/Addition
  "SpaceWar", 
  "Fun With Numbers", 
  "School House", 
  "Speedway/Tag", 
  "Tennis/Squash", 
  "Baseball", 
  "Blackjack", 
  "Gunfighter/Moonship", 
  "RCA Studio 2 Test",
  /////////////////////////
  "RCA Studio 3 Demo",
  "Studio 3 Resident Games", // Studio 3 resident games: Doodle/Patterns/Bowling/Blackjack1/Blackjack2
  "MathFun/Quiz", 
  "Biorhythm", 
  "Pinball", 
  "Bingo", 
  "Concentration/Match", 
  "Star Wars", 
  /////////////////////////
  "Computer", 
  "Hockey", 
  "Combat", 
  "Climber", 
  "Scramble", 
  "Rocket", 
  "Outbreak", 
  "Pacman", 
  "Kaboom", 
  "Asteroids", 
  "Berzerk", 
  "Invaders", 
  "Tv Arcade 2012", 
  ////////////////////////
  "Bowling CHIP8", 
  "Blockout CHIP8X", 
  "Color Test CHIP8X", 
  "Color Kaleidoscope CHIP8X", 
  "VIP Swordfighter",
  ////////////////////////
  "RCA Coin Tag/Bowl", 
  "RCA Coin Arcade Bowling", 
  "RCA Coin Arcade Swords", 
};

String[] gameInfoFileName = {
  // Studio 2 Resident Games
  "RCA_demo.txt",
  "studio2.txt", // Studio 2 internal game ROM with Studio II interpreter
  // Studio 2 game cartridges
  "spacewar.txt", 
  "fun-with-numbers.txt", 
  "school.txt", 
  "speedway.txt", 
  "tennis.txt", 
  "baseball.txt", 
  "blackjack.txt", 
  "gunfighter-moonship.txt", 
  "RCA_TEST_CARTRIDGE_TESTER1.txt",
  "RCA_StudioIIIdemo.txt",
  "victory.txt", // Victory is a Studio 3 internal resident game ROM
  // Studio 3 game cartridges
  "mathfun.txt", 
  "biorhythm.txt", 
  "pinball.txt", 
  "bingo.txt", 
  "concentration-match.txt", 
  "star-wars.txt", 
  ////////////////////////////////
  // Other Studio2 Games 
  "computer.txt", 
  "hockey.txt", 
  "combat.txt", 
  "Climber.txt", 
  "scramble.txt", 
  "rocket.txt", 
  "outbreak.txt", 
  "pacman.txt", 
  "kaboom.txt", 
  "asteroids.txt", 
  "berzerk.txt", 
  "invaders.txt", 
  "tv-arcade-2012.txt", 
  ////////////////////////////////
  // VIP CHIP8 games 
  "Bowling [Gooitzen van der Wal].txt", // Chip8 version of J. Weisbecker bowling
  "Blockout [Steve Houk].txt", // Chip8x 
  "ColourTest.txt", 
  "Color Kaleidoscope [Steve Houk, 1978].txt", 
  "swordfighter[Joe Weisbecker].txt", // swordfighter does not use CHIP8
  ////////////////////////////////
  // RCA Video Arcade games (1974-1975 pre-dates Studio 2) 
  "AUD_2464_09_B41_ID01_01 Tag-Bowling.wav.txt", 
  "AUD_2464_09_B41_ID02_01 Coin Bowling.wav.txt",
  "AUD_2464_09_B41_ID01_02 Swords.wav.txt", 
};


/**
 * Processing setup initialization.
 * Defines screen and clears it.
 * Loads optional game cartridge program from "data" folder.
 * Resets the 1802 CPU emulator.
 */
void settings() {
  android = isAndroid();
  if (android) {
    fullScreen();
  } else {
    //println("displayWidth="+displayWidth + " displayHeight="+displayHeight);
    if (displayWidth > displayHeight) {
      size(2*displayHeight/3, displayHeight);
    }
    //size(1440, 2160);
    // portrait mode, recommended size parameters
    //size(1440, 2160);
    //size(1080,1440);
    //size(960, 1280);
    //size(810, 1080);
    //size(720,1080); // 720 is minimum width for best rendition 
    // since width affects font size used
  }
}

void setup() 
{
  if (android) {
    orientation(PORTRAIT);
  }

  // set default frame rate 60 for the Studio 2 update screen speed
  frameRate(60);  // change to higher frame rate to speed up game play using faster computer

  if (!(gameInfoFileName.length == gameTitle.length &&
    gameTitle.length == gameFileName.length)) {
    println("Internal Error game arrays do not match");
    test = true;  // force test loop
  }
  
  studio2_memory = new int[0x10000];
  for (int i=0; i<0x10000; i++) {
    studio2_memory[i] = 0xFF;
  }

  // run test code here when configured
  if (test) {
    testDisplayScreen();
    while (true) {
      // loop forever
    }
  }
  
  initSound();
  systemReset();
  drawConsole();
}

/**
 * Main drawing loop
 */

void draw() 
{
  int nextState;
  if (doReset) {
    doReset = false;
    systemReset();
  }
  if (displayInfo) {
    updateGUI();
    displayInfo(width, 3*height/8, textInfo, textOffset);
  } else {
    while (true) {
      if (console == ARCADE || console == FRED2) {
        nextState = CPU1801_Execute();  // execute one 1801 CPU instruction until state changes
      } else {
        nextState = CPU_Execute();  // execute one 1802 CPU instruction until frame state changes
      }
      if (nextState == 1) {
        updateGUI();
        displayScreen(false, width, 3*height/8, CPU_GetScreenMemoryAddress(), CPU_GetScreenScrollOffset(), CPU_GetScreenSize());
        break; // leave draw() until the next frame
      }
    }
  }
  
  if (screenSave) {
    save("screenshot/save"+saveCounter+".png");
    println("Save Screenshot "+"save"+saveCounter+".png");
    saveCounter++;
    screenSave = false;
  }
}

/**
 * System reset
 */
void systemReset() {
  coin = false;
  toneState = 0;
  tone(false);
  setFreq(0);
  dmaCount = 0;
  if (gameFileName[gameSelected].toLowerCase().endsWith(".ch8")) {
    console = VIP;
    interpreter = CHIP8;
  } else if (gameFileName[gameSelected].toLowerCase().endsWith(".c8x")) {
    console = VIP;
    interpreter = CHIP8X;
  } else if (gameFileName[gameSelected].toLowerCase().endsWith(".vip")) {
    console = VIP;
    interpreter = ROM_ONLY;
  } else if (gameFileName[gameSelected].toLowerCase().endsWith(".arc")) {
    console = ARCADE;
  } else if (gameFileName[gameSelected].toLowerCase().endsWith(".fd2")) {
    console = FRED2;
  } else if (gameFileName[gameSelected].toLowerCase().endsWith(".cus")) {
    console = CUSTOM;
  } else {
    if (gameSelected >= 0 && gameSelected <= 10)
      console = STUDIO2;
    else
      console = STUDIO3;
  }
  
  COLOR_MAP = INITIAL_COLOR_MAP;
  if (console == STUDIO2 || console == ARCADE || console == FRED2)
    backgroundColor = 1;
  else
    backgroundColor = 0;

  if (console == STUDIO2 || console == STUDIO3) {
    RAM = INITIAL_RAM;
    VIDEO_RAM = INITIAL_VIDEO_RAM;
  } else if (console == VIP) {
    RAM = 0x7E00;
    VIDEO_RAM = 0x7F00;  // assumes 32K byte RAM 
    if (interpreter == CHIP8X) {
      COLOR_MAP = 0xC000;
    }
  } else if (console == ARCADE || console == FRED2) {
    // Arcade and FRED Game development boards
    RAM = 0x0800;
    VIDEO_RAM = 0x0900;
  } else if (console == CUSTOM) {
    // experimental for alternate versions of Joe Weisbecker development boards
    RAM = 0x0800;
    VIDEO_RAM = 0x0900;
  }

  clearAllKeys(); // clear key storage isPressed[]

  CPU_Reset(); // Initialise 1802 CPU

  // Load Game Cartridge
  println("Load " + gameTitle[gameSelected]);
  loadGameBinary(gameFileName[gameSelected]);
  loadGameInfo(gameInfoFileName[gameSelected]);
  
  if (gameFileName[gameSelected].startsWith("RCA_TEST_CARTRIDGE"))
    cartridgeMode = TEST;
  else
    cartridgeMode = NORMAL;

  if (READ(0) == 0) {
    R[0] = 1;  // skip over IDL instruction, must be a RCA FRED COSMAC 1801 Game System
  }

}

public boolean isAndroid() {
  String name = System.getProperty("java.runtime.name");
  println(name);
  if (name.toLowerCase().contains("android"))
    return true;
  else
    return false;
}

//////////////////////////////////////////////////////////////
/**
 * Test Display Emulation
 */
void testDisplayScreen() {
  int pattern = 0x00;
  for (int i=0; i<256; i++) {
    if (i % 32 == 0)
      pattern = pattern ^ 0xCC;
    studio2_memory[i+VIDEO_RAM] = pattern;
  }
  pattern = 0x33;
  for (int i=0; i<256; i++) {
    studio2_memory[i+VIDEO_RAM+256] = pattern;
  }
  pattern = 0x00;
  for (int i=0; i<256; i++) {
    studio2_memory[i+VIDEO_RAM+512] = pattern;
  }
  pattern = 0xFF;
  for (int i=0; i<256; i++) {
    studio2_memory[i+VIDEO_RAM+768] = pattern;
  }
  //displayScreen(true, width, height/2, VIDEO_RAM, CPU_GetScreenScrollOffset(), DISPLAY_SIZE);
  //displayScreen(true, width, height/2, VIDEO_RAM, CPU_GetScreenScrollOffset(), 512);
  displayScreen(false, width, height/2, VIDEO_RAM, CPU_GetScreenScrollOffset(), 1024);
}