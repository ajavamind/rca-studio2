/**
 * RCA Studio II and Studio III Video Game Console Emulator
 *
 * Ported to Java/Processing by Andrew Modla
 * from code C written by Paul Scott Robson.
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
private final static int STUDIO2 = 0;  
private final static int STUDIO3 = 1;  
private static int console = STUDIO3; //STUDIO2;

int backgroundColor = 1;
color BLACK_BACKGROUND = color(0);
color BLUE_BACKGROUND = color(0, 0, 128);
color GREEN_BACKGROUND = color(0, 128, 0);
color RED_BACKGROUND = color(128, 0, 0);
color[] bgColor = {BLUE_BACKGROUND, BLACK_BACKGROUND, GREEN_BACKGROUND, RED_BACKGROUND};
color BLACK = color(0);
color RED = color (255, 0, 0);
color BLUE = color(0, 0, 255);
color VIOLET = color (255, 0, 255);
color GREEN = color(0, 255, 0);
color YELLOW = color(255, 255, 0);
color AQUA = color(0, 255, 255);
color WHITE = color(255, 255, 255);
color[] colorMap = {BLACK, RED, BLUE, VIOLET, GREEN, YELLOW, AQUA, WHITE};

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
  // Other games 
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
/* 28 */  "tv-arcade-2012.st2"
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
  "Studio 3 Resident Games", // Studio 3 (Victory) resident games: Doodle/Patterns/Bowling/Blackjack1/Blackjack2
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
  "Tv Arcade 2012"
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
  }
  else {
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
  
  drawConsole();
  initSound();
  systemReset();
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
  if (console == STUDIO2)
    backgroundColor = 1;
  else
    backgroundColor = 0;

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
    studio2_4k[i+0x900] = pattern;
  }
  displayScreen(true, width, height/2, 0x900, CPU_GetScreenScrollOffset());
}