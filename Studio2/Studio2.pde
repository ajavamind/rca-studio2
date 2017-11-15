/**
 * RCA Studio II and Studio III Video Game Console Emulator
 *
 * Ported to Java/Processing by Andrew Modla
 * from code written by Paul Scott Robson.
 *
 * https://github.com/paulscottrobson/studio2-games
 * Studio 2 emulation: black and white graphics, single tone sound
 * Studio 3 emulation: color graphics, color background, and
 * programmable sound tone generator
 */
 
boolean test = false;  // run test components
boolean sound = true;  // turn on sound emulation

private static final int STUDIO2 = 0;  
private static final int STUDIO3 = 1;  
static int console = STUDIO3; //STUDIO2;

int backgroundColor = 1;
color BLACK_BACKGROUND = color(0);
color BLUE_BACKGROUND = color(0,0,128);
color GREEN_BACKGROUND = color(0, 128, 0);
color RED_BACKGROUND = color(128, 0, 0);
color[] bgColor = {BLUE_BACKGROUND, BLACK_BACKGROUND, GREEN_BACKGROUND, RED_BACKGROUND};
color BLACK = color(0);
color RED = color (255,0,0);
color BLUE = color(0,0, 255);
color VIOLET = color (255,0,255);
color GREEN = color(0,255,0);
color YELLOW = color(255,255,0);
color AQUA = color(0,255,255);
color WHITE = color(255,255,255);
color[] colorMap = {BLACK, RED, BLUE, VIOLET, GREEN, YELLOW, AQUA, WHITE};

//////////////////////////////////////////////////////////////

int gameSelected = 12;
// Game cartridges are in the "data" folder
String[] gameFileName = {
  // Studio 2 Resident Games
  "", // Studio 2 internal game ROM with Studio II interpreter
  // Studio 2 game cartridges
  "SPACEWAR.BIN", 
  "fun-with-numbers.st2",
  "school.st2",
  "SPEEDWAY.BIN", 
  "TENNIS.BIN", 
  "BASEBALL.BIN", 
  "blackjack.st2",
  "gunfighter-moonship.bin", 
  ////////////////////////////////
  "", // Studio 3 internal resident game ROM  (not available)
  // Studio 3 game cartridges implement with color graphics
  "mathfun.st2",
  "biorhythm.st2",
  "pinball.st2",
  "bingo.st2",
  "concentration-match.st2",
  "star-wars.st2",
  ////////////////////////////////
  // Other games
  "computer.st2",
  "hockey.st2",
  "combat.st2",
  "Climber.st2",
  "scramble.st2",
  "rocket.st2",
  "outbreak.st2",
  "pacman.st2",
  "kaboom.st2",
  "asteroids.st2",
  "berzerk.st2",
  "invaders.st2",
  "tv-arcade-2012.st2"
};
String[] gameTitle = {
  "Doodle/Patterns/Bowling/Freeway/Addition", // Studio 2 resident games
  "SpaceWar",
  "Fun With Numbers",
  "School House",
  "Speedway/Tag", 
  "Tennis/Squash", 
  "Baseball", 
  "Blackjack", 
  "Gunfighter/Moonship Battle", 
  /////////////////////////
  "Doodle/Patterns/Bowling/Blackjack", // Studio 3 resident games
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
void setup() 
{
  size(1024, 512);
  // default frame rate is 60 frames per second
  //frameRate(60);  // change frame rate
 
  // test code runs here when configured
  if (test) {
    testDisplayScreen();
    while (true) {
      // loop forever
    }
  }
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
      // update display each frame
      displayScreen(false, CPU_GetScreenMemoryAddress(), CPU_GetScreenScrollOffset());
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
  background(bgColor[backgroundColor]);
  
  clearAllKeys();                               // clear key storage isPressed[]
  
  CPU_Reset();                                  // Initialise 1802 CPU
  // Load Game Cartridge
  if (gameSelected > 0) {
    println("Loading " + gameTitle[gameSelected] + " game cartridge");
    loadGameBinary(gameFileName[gameSelected]);
  }

}

/**
 * Test Display Emulation
 */
void testDisplayScreen() {
  int pattern = 0xAA;
  for (int i=0; i<256; i++) {
    studio2_4k[i+0x900] = pattern;
  }
  displayScreen(true, 0x900, CPU_GetScreenScrollOffset());
}