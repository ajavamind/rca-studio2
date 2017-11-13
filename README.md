# rca-studio2
RCA Studio II and Studio III Home TV Programmer Emulator.

The system is also known as the RCA Studio 2 and Studio 3 game console.

This code is based on work by Paul Robson, 
who wrote a RCA COSMAC CDP1802 microcomputer and Studio 2 emulator.

https://github.com/paulscottrobson/studio2-games 

I converted his well-crafted C code to the Processing language (Java) and I added
emulation for the Studio III game console color graphics. Robson's emulation
is excellent because it simulates the real-time operaton of the Studio 2 quite well, when run
on modern computers. 
You will need to download the Processing SDK to run the emulated games. 
I chose Processing/Java so that the code can be ported or generated for Windows, Apple IOS, Linux, Android, and Web JavaScript.

Please donate to the Processing Foundation.

https://processing.org/

Game ROM cartridges and home-made games included here are from Paul Robson's site and the Emma 02 game console emulation site:

http://www.emma02.hobby-site.com/studio.html

This respository is intended for educational and historic use to show how the games looked and functioned during play. 
Not available in any other emulator, that I am aware, is my Studio 3 emulation, where you can see a color version of Studio III games. 
The Studio III game console was never built by RCA, but I and others wrote games using Studio III prototype boards in 1977.

I was able to add color emulation because I recently found an archived Programming Manual for Studio III, written in September 1977, detailing the color and sound functions. I made some contributions to that document.

Looking back at the games, I think it is amazing how much game function was squeezed into a small 1024 byte ROM cartridge. 
A few larger size code and graphics games did use 2048 bytes, the maximum permitted at that time.
There was an engineering trade-off favoring limits to ROM size and hardware complexity vs faster game speed and color/sound.
The Studio II was better suited for puzzles and card games, than action games. 
Small game size was achieved using interpreter psuedo code to write games instead of coding directly with 1802 CPU instructions.
Games were slow for three reasons: 1) interpreter pseudo code overhead, 2) all graphics were drawn with software instructions without hardware assistance and 3) no game instructions were executed during screen update cycles.

by Andrew Modla, original RCA Studio II/III game developer, 1976-1977.
