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
 */

private final static boolean test = false;  // run test components
private final static boolean sound = true; // control sound on/off
private static boolean android = false;

// Console or Development Board types
private final static int STUDIO2 = 0;  
private final static int STUDIO3 = 1;  
private final static int VIP = 2;
private final static int ELF = 3;
private final static int ARCADE = 4;
private final static int CUSTOM = 5;
private final static int INITIAL_CONSOLE = STUDIO3;  //STUDIO3; //STUDIO2; CUSTOM; ARCADE; 
private static int console = INITIAL_CONSOLE;

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

private static int COIN_ARCADE_AD_ROM = 0x0A00;  // splash barker screen
private static int COIN_ARCADE_PARAMETER_SWITCH = 0x00;  // setting

//////////////////////////////////////////////////////////////

volatile int gameSelected = 9; // Studio III resident games

// Game cartridges are in the "data" folder
String[] gameFileName = {
  // Studio 2 Resident Games
/* 0 */  "studio2.rom", // Studio 2 internal game ROM with Studio II interpreter
  // Studio 2 game cartridges
/* 1 */  "SPACEWAR.BIN", 
/* 2 */  "fun-with-numbers.st2", 
/* 3 */  "school.st2", 
/* 4 */  "SPEEDWAY.BIN", 
/* 5 */  "TENNIS.BIN", 
/* 6 */  "BASEBALL.BIN", 
/* 7 */  "blackjack.st2", 
/* 8 */  "gunfighter-moonship.bin", 
  ////////////////////////////////
  // Studio 3 game cartridges implement with color graphics.
  //The Victory MPT-02, a clone of the RCA Studio III is a videogame console made by Soundic released around 1978. 
  // Unlike the Studio II the Victory came with 2 detachable controllers. 
/* 9 */  "victory.rom", // Victory is a Studio 3 internal resident game ROM
  // Studio 3 game cartridges
/* 10 */  "mathfun.st2", 
/* 11 */  "biorhythm.st2", 
/* 12 */  "pinball.st2", 
/* 13 */  "bingo.st2", 
/* 14 */  "concentration-match.st2", 
/* 15 */  "star-wars.st2", 
  ////////////////////////////////
  // Other Studio2 Games 
/* 16 */  "computer.st2", 
/* 17 */  "hockey.st2", 
/* 18 */  "combat.st2", 
/* 19 */  "Climber.st2", 
/* 20 */  "scramble.st2", 
/* 21 */  "rocket.st2", 
/* 22 */  "outbreak.st2", 
/* 23 */  "pacman.st2", 
/* 24 */  "kaboom.st2", 
/* 25 */  "asteroids.st2", 
/* 26 */  "berzerk.st2", 
/* 27 */  "invaders.st2", 
/* 28 */  "tv-arcade-2012.st2", 
  ////////////////////////////////
  // VIP CHIP8 games 
/* 29 */  "Bowling [Gooitzen van der Wal].ch8", // Chip8 version of J. Weisbecker bowling
/* 30 */  "Blockout [Steve Houk].c8x",   // Chip8x 
/* 31 */  "ColourTest.c8x",
/* 32 */  "Color Kaleidoscope [Steve Houk, 1978].c8x",
/* 33 */  "swordfighter[Joe Weisbecker].vip",   // swordfighter does not use CHIP8
///*  */  "invad.bin", // * SPACE INVADERS FOR THE RCA COSMAC ELF CREATED BY CHARLIE BRINT IN 1980
///*  */  "SoundTest.c8x"
///* 34 */ "AUD_2464_09_B41_ID01_01_01.arc" // coin arcade game bowling

};
String[] gameTitle = {
  "Studio2 Resident Games", // Studio 2 resident games: Doodle/Patterns/Bowling/Freeway/Addition
  "SpaceWar", 
  "Fun With Numbers", 
  "School House", 
  "Speedway/Tag", 
  "Tennis/Squash", 
  "Baseball", 
  "Blackjack", 
  "Gunfighter/Moonship", 
  /////////////////////////
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
  "VIP Swordfighter"
//  "Space Invaders",
// Work in progress
//  "Sound Test CHIP8X"
//  "AUD_2464_09_B41_ID01_01_01"
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

  // default frame rate is 60 frames per second, the Studio 2 update screen speed
  //frameRate(90);  // uncomment to change frame rate to speed up game play

  // run test code here when configured
  if (test) {
    testDisplayScreen();
    while (true) {
      // loop forever
    }
  }
  studio2_memory = new int[0x10000];
  for (int i=0; i<0x10000; i++) {
    studio2_memory[i] = 0xFF;
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
  int state;

  while (true) {
    state = CPU_Execute();  // execute one 1802 CPU instruction until frame state changes
    if (state == 1) {
      updateGUI();
      displayScreen(false, width, 3*height/8, CPU_GetScreenMemoryAddress(), CPU_GetScreenScrollOffset());
      break; // leave draw() until the next frame
    }
  }
}

/**
 * System reset
 */
void systemReset() {
  tone(false);
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
  } else {
    console = INITIAL_CONSOLE;
  }
  COLOR_MAP = INITIAL_COLOR_MAP;
  if (console == STUDIO2 || console == ARCADE)
    backgroundColor = 1;
  else
    backgroundColor = 0;

  if (console == STUDIO2 || console == STUDIO3) {
    RAM = INITIAL_RAM;
    VIDEO_RAM = INITIAL_VIDEO_RAM;
  }
  else if (console == VIP) {
    RAM = 0x7E00;
    VIDEO_RAM = 0x7F00;  // assumes 32K byte RAM 
    if (interpreter == CHIP8X) {
      COLOR_MAP = 0xC000;
    }
  } else if (console == ARCADE) {
    // experimental for alternate versions of Joe Weisbecker development boards
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
  int pattern = 0xAA;
  for (int i=0; i<256; i++) {
    studio2_memory[i+VIDEO_RAM] = pattern;
  }
  displayScreen(true, width, height/2, VIDEO_RAM, CPU_GetScreenScrollOffset());
}