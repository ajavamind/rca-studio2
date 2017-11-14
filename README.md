# RCA Studio II and Studio III Home TV Programmer
![](Studio2logo.jpg)

The system is also known as the RCA Studio 2 and Studio 3 game console.

## Studio II Emulator

The emulator code in this repository is based on work by Paul Robson, 
who wrote a RCA COSMAC CDP1802 microcomputer and Studio 2 console emulator.

https://github.com/paulscottrobson/studio2-games 

## Studio III Emulator

Not available in any other emulator, that I am aware, is my Studio 3 emulation, where you can see a color version of Studio III games. 
The Studio III game console was never built by RCA, but I and others wrote games using Studio III prototype boards in 1977.

![Screenshot of Studio III Pinball Game](Studio2/screenshot/pinball.png)

I converted Robson's well-crafted C code to the Processing language (Java) and I added
emulation for the Studio III game console color graphics. Robson's emulation
is excellent because it simulates the real-time operaton of the Studio 2 quite well, when run
on modern computers. 

## Running the Emulator

You will need to download the Processing SDK to run the emulated games. 
I chose Processing/Java so that the code can be ported or generated for Windows, Apple IOS, Linux, Android, and Web JavaScript.

Please donate to the Processing Foundation.

https://processing.org/

## Using the Emulator

As currently implemented the emulator uses the number keys 0-9 for the A keypad on the Studio II console, and the numeric keys (num lock) for keys 0-9 on the B keypad.

For debug the following keys may be used:
- 'R' key performs a system reset
- 'S' key saves a screen shot in the folder "screenshot"
- 'F' show the frame rate in the Processing SDK console terminal output area

You will need to set the "gameSelected" variable array index to change the game run.

## Games
Game ROM cartridges and home-made games included here are from Paul Robson's site and the Emma 02 game console emulation site:

http://www.emma02.hobby-site.com/studio.html

I was able to add color emulation because I recently found an archived Programming Manual for Studio III, written in September 1977, detailing the color and sound functions. I made some contributions to that document.

## Console Design
Looking back at the games, it is amazing to me how much game function was squeezed into a small 1024 byte ROM cartridge. 
Resident game ROMs that included a game instruction pseudo code interpreter are 2048 bytes.

There was an engineering cost trade-off that favored limits to ROM size and hardware complexity vs faster game speed, screen display size, and color/sound.
Small game size was achieved using interpreter psuedo code to write games instead of coding directly with 1802 CPU instructions. The hardware design was elegant and relatively simple.

Games were slow for three reasons: 
1. Interpreter pseudo code overhead
2. Drawing graphics with software instructions without hardware assistance 
3. No game instruction execution during screen update cycles. 

The Studio II system was better suited for puzzles and card games, rather than action games. 


## Game Developers
| Studio II Monochrome Game | Author | Notes |
| --------- | ------ | ----- |
| Doodle/Patterns/Bowling/Freeway/Addition | Joseph Weisbecker | Studio II Resident Games |
| Space War | Jeff Winsor | |
| Fun With Numbers | Philip Baltzer |   |
| School House | Joyce Weisbecker | Daughter of Joseph Weisbecker |
| Speedway/Tag | Joyce Weisbecker | |
| Tennis/Squash | Andrew Modla | |
| Baseball | Andrew Modla | |
| Blackjack | Andrew Modla | |
| Gunfighter/Moonship Battle | Andrew Modla  | |

| Studio III Color Game | Author | Notes |
| --------- | ------ | ----- |
| Doodle/Patterns/Bowling/Blackjack | Joseph Weisbecker, Andrew Modla (Blackjack) | Studio III Resident Games |
| MathFun/Quiz | ? |  |
| Biorhythm | Gooitzen Van Der Wal |  |
| Pinball | Andrew Modla |  |
| Bingo | Andrew Modla | Not a game, this is a Bingo number caller and verification aid |
| Concentration/Match | Gooitzen Van Der Wal |  |
| Star Wars | Gooitzen Van Der Wal |  |

| Other Studio II Games | Author | Notes |
| --------- | ------ | ----- |
| Computer | ? | Not a game |
| Hockey | Paul Robson | |
| Combat | Paul Robson | |
| Scramble | Paul Robson | |
| Rocket | ? | |
| Outbreak | ? | |
| Pacman | Paul Robson | |
| Kaboom | Paul Robson | |
| Asteroids | Paul Robson | |
| Berzerk | Paul Robson | |
| Invaders | Paul Robson | |
| Tv Arcade 2012 | ? | |

This respository is intended for educational and historic research usage to show how the games looked and functioned during play. 

by Andrew Modla, RCA Studio II/III game developer, 1976-1977.
