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
 * RCA CDP 1801 Arcade game console emulation
 * Processing/Java programming environment by Andrew Modla
 * from Cpu.C  Processor Emulation code by Paul Robson, 24th February 2013
 * January 2018
 *
 * Processing uses signed integers (byte and int) requiring register size masking in code below
 */

import java.io.*;

// Estimated for FRED 2 computer boards
// These parameters are guesses based partially on play speed and game tempo
private static final int CLOCK_SPEED_ARCADE        =     (1600000); // 2000000;   // Clock Frequency 
private static final int CYCLES_PER_SECOND_ARCADE  =     (CLOCK_SPEED_ARCADE/8);  // There are 8 clocks in each cycle (200,000 cycles/Second)
private static final int FRAMES_PER_SECOND_ARCADE  =     (60);            // NTSC Frames Per Second
private static final int CYCLES_PER_FRAME_ARCADE   =     (CYCLES_PER_SECOND_ARCADE / FRAMES_PER_SECOND_ARCADE); // Cycles per Frame (3333.33)
private static final int VISIBLE_LINES_ARCADE      =     128;  // Guess for Arcade! Used to set dmaCount that can change timing
private static final int DMA_COUNT_PER_LINE        =     8;
private static final int DMA_COUNT                 =     (VISIBLE_LINES_ARCADE / DMA_COUNT_PER_LINE);  // (16)
// seems to provide the best game timing, lacking Arcade documentation to know for sure.
private static final int DISPLAY_DMA_CYCLES_PER_FRAME =  (VISIBLE_LINES_ARCADE * DMA_COUNT_PER_LINE);  // 1024     32 rows x 64 columns
private static final int STATE_2_CYCLES_ARCADE     =     140;  // estimated max interrupt cycles used - varies with game (FRED2)
private static final int STATE_1_CYCLES_ARCADE     =     (CYCLES_PER_FRAME_ARCADE - DISPLAY_DMA_CYCLES_PER_FRAME) - STATE_2_CYCLES_ARCADE; // 2169

int unusedCycles = 0;

//*******************************************************************************************************
// Execute one CDP1801 microprocessor instruction
//*******************************************************************************************************
int CPU1801_Execute()
{
  int rState = 0;
  int addr = R[P];
    
  previous = addr;
  opCode = READ(addr);
    
  if (opCode == 0x70) {
    // ready to exit interrupt with R0 DMA pointer set
    if (state == 2) {
      unusedCycles = cycles;
      cycles = 0;
      screenMemory = (R[0] & 0xFF00) ;     // display location
      scrollOffset = R[0] & 0xFF;          // Get the scrolling offset (for things like the car game)
    }
  }

  R[P]++;
  R[P] &= 0xFFFF;
  
  // Only two machine cycles per instruction
  cycles -= 2;                                              // 2 x 8 clock Cycles - Fetch and Execute.
  instructionCycles += 2;  // debug

  switch(opCode)                                            // Execute dependent on the Operation Code //<>//
  {
  case 0x00: /* "idl" */
    if (dmaCount != 0) {
      dmaCount--;
      instructionCycles++;  // debug
    }
    else {
      R[P]--;
      R[P] &= 0xFFFF;
    }
    break;
  case 0x01: /* "ldn r1" */
  case 0x02: /* "ldn r2" */
  case 0x03: /* "ldn r3" */
  case 0x04: /* "ldn r4" */
  case 0x05: /* "ldn r5" */
  case 0x06: /* "ldn r6" */
  case 0x07: /* "ldn r7" */
  case 0x08: /* "ldn r8" */
  case 0x09: /* "ldn r9" */
  case 0x0a: /* "ldn ra" */
  case 0x0b: /* "ldn rb" */
  case 0x0c: /* "ldn rc" */
  case 0x0d: /* "ldn rd" */
  case 0x0e: /* "ldn re" */
  case 0x0f: /* "ldn rf" */
    println("1802 instruction " + hexData(opCode));
    break;
  case 0x10: /* "inc r0" */
    R[0]++;
    R[0] &= 0xFFFF;
    break;
  case 0x11: /* "inc r1" */
    R[1]++;
    R[1] &= 0xFFFF;
    break;
  case 0x12: /* "inc r2" */
    R[2]++;
    R[2] &= 0xFFFF;
    break;
  case 0x13: /* "inc r3" */
    R[3]++;
    R[3] &= 0xFFFF;
    break;
  case 0x14: /* "inc r4" */
    R[4]++;
    R[4] &= 0xFFFF;
    break;
  case 0x15: /* "inc r5" */
    R[5]++;
    R[5] &= 0xFFFF;
    break;
  case 0x16: /* "inc r6" */
    R[6]++;
    R[6] &= 0xFFFF;
    break;
  case 0x17: /* "inc r7" */
    R[7]++;
    R[7] &= 0xFFFF;
    break;
  case 0x18: /* "inc r8" */
    R[8]++;
    R[8] &= 0xFFFF;
    break;
  case 0x19: /* "inc r9" */
    R[9]++;
    R[9] &= 0xFFFF;
    break;
  case 0x1a: /* "inc ra" */
    R[10]++;
    R[10] &= 0xFFFF;
    break;
  case 0x1b: /* "inc rb" */
    R[11]++;
    R[11] &= 0xFFFF;
    break;
  case 0x1c: /* "inc rc" */
    R[12]++;
    R[12] &= 0xFFFF;
    break;
  case 0x1d: /* "inc rd" */
    R[13]++;
    R[13] &= 0xFFFF;
    break;
  case 0x1e: /* "inc re" */
    R[14]++;
    R[14] &= 0xFFFF;
    break;
  case 0x1f: /* "inc rf" */
    R[15]++;
    R[15] &= 0xFFFF;
    break;
  case 0x20: /* "dec r0" */
    R[0]--;
    R[0] &= 0xFFFF;
    break;
  case 0x21: /* "dec r1" */
    R[1]--;
    R[1] &= 0xFFFF;
    break;
  case 0x22: /* "dec r2" */
    R[2]--;
    R[2] &= 0xFFFF;
    break;
  case 0x23: /* "dec r3" */
    R[3]--;
    R[3] &= 0xFFFF;
    break;
  case 0x24: /* "dec r4" */
    R[4]--;
    R[4] &= 0xFFFF;
    break;
  case 0x25: /* "dec r5" */
    R[5]--;
    R[5] &= 0xFFFF;
    break;
  case 0x26: /* "dec r6" */
    R[6]--;
    R[6] &= 0xFFFF;
    break;
  case 0x27: /* "dec r7" */
    R[7]--;
    R[7] &= 0xFFFF;
    break;
  case 0x28: /* "dec r8" */
    R[8]--;
    R[8] &= 0xFFFF;
    break;
  case 0x29: /* "dec r9" */
    R[9]--;
    R[9] &= 0xFFFF;
    break;
  case 0x2a: /* "dec ra" */
    R[10]--;
    R[10] &= 0xFFFF;
    break;
  case 0x2b: /* "dec rb" */
    R[11]--;
    R[11] &= 0xFFFF;
    break;
  case 0x2c: /* "dec rc" */
    R[12]--;
    R[12] &= 0xFFFF;
    break;
  case 0x2d: /* "dec rd" */
    R[13]--;
    R[13] &= 0xFFFF;
    break;
  case 0x2e: /* "dec re" */
    R[14]--;
    R[14] &= 0xFFFF;
    break;
  case 0x2f: /* "dec rf" */
    R[15]--;
    R[15] &= 0xFFFF;
    break;
  case 0x30: /* "br .1" */
    _temp = FETCH2();
    SHORT(_temp);
    break;
  case 0x31: /* "bq .1" */
    println("1802 instruction " + hexData(opCode));
    break;
  case 0x32: /* "bz .1" */
    _temp = FETCH2(); 
    if ((D == 0)) SHORT(_temp);
    break;
  case 0x33: /* "bdf .1" */
    _temp = FETCH2(); 
    if ((DF != 0)) SHORT(_temp);
    break;
  case 0x34: /* "b1 .1" */
    _temp = FETCH2(); 
    if ((READEFLAG(1) != 0)) SHORT(_temp);
    break;
  case 0x35: /* "b2 .1" */
    _temp = FETCH2(); 
    if ((READEFLAG(2) != 0)) SHORT(_temp);
    break;
  case 0x36: /* "b3 .1" */
    _temp = FETCH2(); 
    if ((READEFLAG(3) != 0)) SHORT(_temp);
    break;
  case 0x37: /* "b4 .1" */
    _temp = FETCH2(); 
    if ((READEFLAG(4) != 0)) SHORT(_temp);
    break;
  case 0x38: /* "skp" */
    _temp = FETCH2();
    break;
  case 0x39: /* "bnq .1" */
    println("1802 instruction " + hexData(opCode));
    break;
  case 0x3a: /* "bnz .1" */
    _temp = FETCH2(); 
    if (!((D == 0))) SHORT(_temp);
    break;
  case 0x3b: /* "bnf .1" */
    _temp = FETCH2(); 
    if (!((DF != 0))) SHORT(_temp);
    break;
  case 0x3c: /* "bn1 .1" */
    _temp = FETCH2(); 
    if (!((READEFLAG(1) != 0))) SHORT(_temp);
    break;
  case 0x3d: /* "bn2 .1" */
    _temp = FETCH2(); 
    if (!((READEFLAG(2) != 0))) SHORT(_temp);
    break;
  case 0x3e: /* "bn3 .1" */
    _temp = FETCH2(); 
    if (!((READEFLAG(3) != 0))) SHORT(_temp);
    break;
  case 0x3f: /* "bn4 .1" */
    _temp = FETCH2(); 
    if (!((READEFLAG(4) != 0))) SHORT(_temp);
    break;
  case 0x40: /* "lda r0" */
    D = READ(R[0]);
    R[0]++;
    R[0] &= 0xFFFF;
    break;
  case 0x41: /* "lda r1" */
    D = READ(R[1]);
    R[1]++;
    R[1] &= 0xFFFF;
    break;
  case 0x42: /* "lda r2" */
    D = READ(R[2]);
    R[2]++;
    R[2] &= 0xFFFF;
    break;
  case 0x43: /* "lda r3" */
    D = READ(R[3]);
    R[3]++;
    R[3] &= 0xFFFF;
    break;
  case 0x44: /* "lda r4" */
    D = READ(R[4]);
    R[4]++;
    R[4] &= 0xFFFF;
    break;
  case 0x45: /* "lda r5" */
    D = READ(R[5]);
    R[5]++;
    R[5] &= 0xFFFF;
    break;
  case 0x46: /* "lda r6" */
    D = READ(R[6]);
    R[6]++;
    R[6] &= 0xFFFF;
    break;
  case 0x47: /* "lda r7" */
    D = READ(R[7]);
    R[7]++;
    R[7] &= 0xFFFF;
    break;
  case 0x48: /* "lda r8" */
    D = READ(R[8]);
    R[8]++;
    R[8] &= 0xFFFF;
    break;
  case 0x49: /* "lda r9" */
    D = READ(R[9]);
    R[9]++;
    R[9] &= 0xFFFF;
    break;
  case 0x4a: /* "lda ra" */
    D = READ(R[10]);
    R[10]++;
    R[10] &= 0xFFFF;
    break;
  case 0x4b: /* "lda rb" */
    D = READ(R[11]);
    R[11]++;
    R[11] &= 0xFFFF;
    break;
  case 0x4c: /* "lda rc" */
    D = READ(R[12]);
    R[12]++;
    R[12] &= 0xFFFF;
    break;
  case 0x4d: /* "lda rd" */
    D = READ(R[13]);
    R[13]++;
    R[13] &= 0xFFFF;
    break;
  case 0x4e: /* "lda re" */
    D = READ(R[14]);
    R[14]++;
    R[14] &= 0xFFFF;
    break;
  case 0x4f: /* "lda rf" */
    D = READ(R[15]);
    R[15]++;
    R[15] &= 0xFFFF;
    break;
  case 0x50: /* "str r0" */
    WRITE(R[0], D);
    break;
  case 0x51: /* "str r1" */
    WRITE(R[1], D);
    break;
  case 0x52: /* "str r2" */
    WRITE(R[2], D);
    break;
  case 0x53: /* "str r3" */
    WRITE(R[3], D);
    break;
  case 0x54: /* "str r4" */
    WRITE(R[4], D);
    break;
  case 0x55: /* "str r5" */
    WRITE(R[5], D);
    break;
  case 0x56: /* "str r6" */
    WRITE(R[6], D);
    break;
  case 0x57: /* "str r7" */
    WRITE(R[7], D);
    break;
  case 0x58: /* "str r8" */
    WRITE(R[8], D);
    break;
  case 0x59: /* "str r9" */
    WRITE(R[9], D);
    break;
  case 0x5a: /* "str ra" */
    WRITE(R[10], D);
    break;
  case 0x5b: /* "str rb" */
    WRITE(R[11], D);
    break;
  case 0x5c: /* "str rc" */
    WRITE(R[12], D);
    break;
  case 0x5d: /* "str rd" */
    WRITE(R[13], D);
    break;
  case 0x5e: /* "str re" */
    WRITE(R[14], D);
    break;
  case 0x5f: /* "str rf" */
    WRITE(R[15], D);
    break;
  case 0x60: /* "irx" */
    println("1802 instruction " + hexData(opCode));
    break;
  case 0x61: /* "out 1" */
    UPDATEIO(1, READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    //if (console == STUDIO3) {
    //  backgroundColor++;
    //  if (backgroundColor >= bgColor.length)
    //    backgroundColor = 0;
    //}
    break;
  case 0x62: /* "out 2" */
    UPDATEIO(2, READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
  case 0x63: /* "out 3" */
    UPDATEIO(3, READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
  case 0x64: /* "out 4" */
    UPDATEIO(4, READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
  case 0x65: /* "out 5" */
    UPDATEIO(5, READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
  case 0x66: /* "out 6" */
    UPDATEIO(6, READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
  case 0x67: /* "out 7" */
    UPDATEIO(7, READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
  case 0x68: /* "nop68" */
    println("1802 instruction " + hexData(opCode));
    break;
  case 0x69: /* "inp 1" */
    D = INPUTIO(1);
    WRITE(R[X], D);
    break;
  case 0x6a: /* "inp 2" */
    D = INPUTIO(2);
    WRITE(R[X], D);
    break;
  case 0x6b: /* "inp 3" */
    D = INPUTIO(3);
    WRITE(R[X], D);
    break;
  case 0x6c: /* "inp 4" */
    D = INPUTIO(4);
    WRITE(R[X], D);
    break;
  case 0x6d: /* "inp 5" */
    D = INPUTIO(5);
    WRITE(R[X], D);
    break;
  case 0x6e: /* "inp 6" */
    D = INPUTIO(6);
    WRITE(R[X], D);
    break;
  case 0x6f: /* "inp 7" */
    D = INPUTIO(7);
    WRITE(R[X], D);
    break;
  case 0x70: /* "ret" */
    RETURN();
    IE = 1;
    break;
  case 0x71: /* "dis" */
    RETURN();
    IE = 0;
    break;
  case 0x72: /* "ldxa" */
  case 0x73: /* "stxd" */
  case 0x74: /* "adc" */
  case 0x75: /* "sdb" */
  case 0x76: /* "rshr" */
  case 0x77: /* "smb" */
      println("1802 instruction " + hexData(opCode));
    break;
  case 0x78: /* "sav" */
    WRITE(R[X], T);
    break;
  case 0x79: /* "mark" */
  case 0x7a: /* "req" */
  case 0x7b: /* "seq" */
  case 0x7c: /* "adci .1" */
  case 0x7d: /* "sdbi .1" */
  case 0x7e: /* "rshl" */
  case 0x7f: /* "smbi .1" */
    println("1802 instruction " + hexData(opCode));
    break;
  case 0x80: /* "glo r0" */
    D = R[0] & 0xFF;
    break;
  case 0x81: /* "glo r1" */
    D = R[1] & 0xFF;
    break;
  case 0x82: /* "glo r2" */
    D = R[2] & 0xFF;
    break;
  case 0x83: /* "glo r3" */
    D = R[3] & 0xFF;
    break;
  case 0x84: /* "glo r4" */
    D = R[4] & 0xFF;
    break;
  case 0x85: /* "glo r5" */
    D = R[5] & 0xFF;
    break;
  case 0x86: /* "glo r6" */
    D = R[6] & 0xFF;
    break;
  case 0x87: /* "glo r7" */
    D = R[7] & 0xFF;
    break;
  case 0x88: /* "glo r8" */
    D = R[8] & 0xFF;
    break;
  case 0x89: /* "glo r9" */
    D = R[9] & 0xFF;
    break;
  case 0x8a: /* "glo ra" */
    D = R[10] & 0xFF;
    break;
  case 0x8b: /* "glo rb" */
    D = R[11] & 0xFF;
    break;
  case 0x8c: /* "glo rc" */
    D = R[12] & 0xFF;
    break;
  case 0x8d: /* "glo rd" */
    D = R[13] & 0xFF;
    break;
  case 0x8e: /* "glo re" */
    D = R[14] & 0xFF;
    break;
  case 0x8f: /* "glo rf" */
    D = R[15] & 0xFF;
    break;
  case 0x90: /* "ghi r0" */
    D = (R[0] >> 8) & 0xFF;
    break;
  case 0x91: /* "ghi r1" */
    D = (R[1] >> 8) & 0xFF;
    break;
  case 0x92: /* "ghi r2" */
    D = (R[2] >> 8) & 0xFF;
    break;
  case 0x93: /* "ghi r3" */
    D = (R[3] >> 8) & 0xFF;
    break;
  case 0x94: /* "ghi r4" */
    D = (R[4] >> 8) & 0xFF;
    break;
  case 0x95: /* "ghi r5" */
    D = (R[5] >> 8) & 0xFF;
    break;
  case 0x96: /* "ghi r6" */
    D = (R[6] >> 8) & 0xFF;
    break;
  case 0x97: /* "ghi r7" */
    D = (R[7] >> 8) & 0xFF;
    break;
  case 0x98: /* "ghi r8" */
    D = (R[8] >> 8) & 0xFF;
    break;
  case 0x99: /* "ghi r9" */
    D = (R[9] >> 8) & 0xFF;
    break;
  case 0x9a: /* "ghi ra" */
    D = (R[10] >> 8) & 0xFF;
    break;
  case 0x9b: /* "ghi rb" */
    D = (R[11] >> 8) & 0xFF;
    break;
  case 0x9c: /* "ghi rc" */
    D = (R[12] >> 8) & 0xFF;
    break;
  case 0x9d: /* "ghi rd" */
    D = (R[13] >> 8) & 0xFF;
    break;
  case 0x9e: /* "ghi re" */
    D = (R[14] >> 8) & 0xFF;
    break;
  case 0x9f: /* "ghi rf" */
    D = (R[15] >> 8) & 0xFF;
    break;
  case 0xa0: /* "plo r0" */
    R[0] = (R[0] & 0xFF00) | D;
    R[0] &= 0xFFFF;
    break;
  case 0xa1: /* "plo r1" */
    R[1] = (R[1] & 0xFF00) | D;
    R[1] &= 0xFFFF;
    break;
  case 0xa2: /* "plo r2" */
    R[2] = (R[2] & 0xFF00) | D;
    R[2] &= 0xFFFF;
    break;
  case 0xa3: /* "plo r3" */
    R[3] = (R[3] & 0xFF00) | D;
    R[3] &= 0xFFFF;
    break;
  case 0xa4: /* "plo r4" */
    R[4] = (R[4] & 0xFF00) | D;
    R[4] &= 0xFFFF;
    break;
  case 0xa5: /* "plo r5" */
    R[5] = (R[5] & 0xFF00) | D;
    R[5] &= 0xFFFF;
    break;
  case 0xa6: /* "plo r6" */
    R[6] = (R[6] & 0xFF00) | D;
    R[6] &= 0xFFFF;
    break;
  case 0xa7: /* "plo r7" */
    R[7] = (R[7] & 0xFF00) | D;
    R[7] &= 0xFFFF;
    break;
  case 0xa8: /* "plo r8" */
    R[8] = (R[8] & 0xFF00) | D;
    R[8] &= 0xFFFF;
    break;
  case 0xa9: /* "plo r9" */
    R[9] = (R[9] & 0xFF00) | D;
    R[9] &= 0xFFFF;
    break;
  case 0xaa: /* "plo ra" */
    R[10] = (R[10] & 0xFF00) | D;
    R[10] &= 0xFFFF;
    break;
  case 0xab: /* "plo rb" */
    R[11] = (R[11] & 0xFF00) | D;
    R[11] &= 0xFFFF;
    break;
  case 0xac: /* "plo rc" */
    R[12] = (R[12] & 0xFF00) | D;
    R[12] &= 0xFFFF;
    break;
  case 0xad: /* "plo rd" */
    R[13] = (R[13] & 0xFF00) | D;
    R[13] &= 0xFFFF;
    break;
  case 0xae: /* "plo re" */
    R[14] = (R[14] & 0xFF00) | D;
    R[14] &= 0xFFFF;
    break;
  case 0xaf: /* "plo rf" */
    R[15] = (R[15] & 0xFF00) | D;
    R[15] &= 0xFFFF;
    break;
  case 0xb0: /* "phi r0" */
    R[0] = (R[0] & 0x00FF) | (D << 8);
    R[0] &= 0xFFFF;
    break;
  case 0xb1: /* "phi r1" */
    R[1] = (R[1] & 0x00FF) | (D << 8);
    R[1] &= 0xFFFF;
    break;
  case 0xb2: /* "phi r2" */
    R[2] = (R[2] & 0x00FF) | (D << 8);
    R[2] &= 0xFFFF;
    break;
  case 0xb3: /* "phi r3" */
    R[3] = (R[3] & 0x00FF) | (D << 8);
    R[3] &= 0xFFFF;
    break;
  case 0xb4: /* "phi r4" */
    R[4] = (R[4] & 0x00FF) | ((D) << 8);
    R[4] &= 0xFFFF;
    break;
  case 0xb5: /* "phi r5" */
    R[5] = (R[5] & 0x00FF) | ((D) << 8);
    R[5] &= 0xFFFF;
    break;
  case 0xb6: /* "phi r6" */
    R[6] = (R[6] & 0x00FF) | ((D) << 8);
    R[6] &= 0xFFFF;
    break;
  case 0xb7: /* "phi r7" */
    R[7] = (R[7] & 0x00FF) | ((D) << 8);
    R[7] &= 0xFFFF;
    break;
  case 0xb8: /* "phi r8" */
    R[8] = (R[8] & 0x00FF) | ((D) << 8);
    R[8] &= 0xFFFF;
    break;
  case 0xb9: /* "phi r9" */
    R[9] = (R[9] & 0x00FF) | ((D) << 8);
    R[9] &= 0xFFFF;
    break;
  case 0xba: /* "phi ra" */
    R[10] = (R[10] & 0x00FF) | ((D) << 8);
    R[10] &= 0xFFFF;
    break;
  case 0xbb: /* "phi rb" */
    R[11] = (R[11] & 0x00FF) | ((D) << 8);
    R[11] &= 0xFFFF;
    break;
  case 0xbc: /* "phi rc" */
    R[12] = (R[12] & 0x00FF) | ((D) << 8);
    R[12] &= 0xFFFF;
    break;
  case 0xbd: /* "phi rd" */
    R[13] = (R[13] & 0x00FF) | ((D) << 8);
    R[13] &= 0xFFFF;
    break;
  case 0xbe: /* "phi re" */
    R[14] = (R[14] & 0x00FF) | ((D) << 8);
    R[14] &= 0xFFFF;
    break;
  case 0xbf: /* "phi rf" */
    R[15] = (R[15] & 0x00FF) | ((D) << 8);
    R[15] &= 0xFFFF;
    break;
  case 0xc0: /* "lbr .2" */
  case 0xc1: /* "lbq .2" */
  case 0xc2: /* "lbz .2" */
  case 0xc3: /* "lbdf .2" */
  case 0xc4: /* "nop" */
  case 0xc5: /* "lsnq" */
  case 0xc6: /* "lsnz" */
  case 0xc7: /* "lsnf" */
  case 0xc8: /* "lskp" */
  case 0xc9: /* "lbnq .2" */
  case 0xca: /* "lbnz .2" */
  case 0xcb: /* "lbnf .2" */
  case 0xcc: /* "lsie" */
  case 0xcd: /* "lsq" */
  case 0xce: /* "lsz" */
  case 0xcf: /* "lsdf" */
    println("1802 instruction " + hexData(opCode));
    break;
  case 0xd0: /* "sep r0" */
    P = 0;
    break;
  case 0xd1: /* "sep r1" */
    P = 1;
    break;
  case 0xd2: /* "sep r2" */
    P = 2;
    break;
  case 0xd3: /* "sep r3" */
    P = 3;
    break;
  case 0xd4: /* "sep r4" */
    P = 4;
    break;
  case 0xd5: /* "sep r5" */
    P = 5;
    break;
  case 0xd6: /* "sep r6" */
    P = 6;
    break;
  case 0xd7: /* "sep r7" */
    P = 7;
    break;
  case 0xd8: /* "sep r8" */
    P = 8;
    break;
  case 0xd9: /* "sep r9" */
    P = 9;
    break;
  case 0xda: /* "sep ra" */
    P = 10;
    break;
  case 0xdb: /* "sep rb" */
    P = 11;
    break;
  case 0xdc: /* "sep rc" */
    P = 12;
    break;
  case 0xdd: /* "sep rd" */
    P = 13;
    break;
  case 0xde: /* "sep re" */
    P = 14;
    break;
  case 0xdf: /* "sep rf" */
    P = 15;
    break;
  case 0xe0: /* "sex r0" */
    X = 0;
    break;
  case 0xe1: /* "sex r1" */
    X = 1;
    break;
  case 0xe2: /* "sex r2" */
    X = 2;
    break;
  case 0xe3: /* "sex r3" */
    X = 3;
    break;
  case 0xe4: /* "sex r4" */
    X = 4;
    break;
  case 0xe5: /* "sex r5" */
    X = 5;
    break;
  case 0xe6: /* "sex r6" */
    X = 6;
    break;
  case 0xe7: /* "sex r7" */
    X = 7;
    break;
  case 0xe8: /* "sex r8" */
    X = 8;
    break;
  case 0xe9: /* "sex r9" */
    X = 9;
    break;
  case 0xea: /* "sex ra" */
    X = 10;
    break;
  case 0xeb: /* "sex rb" */
    X = 11;
    break;
  case 0xec: /* "sex rc" */
    X = 12;
    break;
  case 0xed: /* "sex rd" */
    X = 13;
    break;
  case 0xee: /* "sex re" */
    X = 14;
    break;
  case 0xef: /* "sex rf" */
    X = 15;
    break;
  case 0xf0: /* "ldx" */
    D = READ(R[X]);
    break;
  case 0xf1: /* "or" */
    D = D | READ(R[X]);
    break;
  case 0xf2: /* "and" */
    D = D & READ(R[X]);
    break;
  case 0xf3: /* "xor" */
    D = D ^ READ(R[X]);
    D &= 0xFF;
    break;
  case 0xf4: /* "add" */
    ADD(D, READ(R[X]), 0);
    break;
  case 0xf5: /* "sd" */
    SUB(READ(R[X]), D, 1);
    break;
  case 0xf6: /* "shr" */
    DF = D & 1;
    D = (D >> 1) & 0x7F;
    break;
  case 0xf7: /* "sm" */
    SUB(D, READ(R[X]), 1);
    break;
  case 0xf8: /* "ldi .1" */
    D = FETCH2();
    break;
  case 0xf9: /* "ori .1" */
    D = D | FETCH2();
    break;
  case 0xfa: /* "ani .1" */
    D = D & FETCH2();
    break;
  case 0xfb: /* "xri .1" */
    D = D ^ FETCH2();
    D &= 0xFF;
    break;
  case 0xfc: /* "adi .1" */
    ADD(D, FETCH2(), 0);
    break;
  case 0xfd: /* "sdi .1" */
    SUB(FETCH2(), D, 1);
    break;
  case 0xfe: /* "shl" */
    DF = (D >> 7) & 1; 
    D = (D << 1) & 0xFF;
    break;
  case 0xff: /* "smi .1" */
    SUB(D, FETCH2(), 1);
    break;
  } // switch

  if (cycles < 0)                                                             // Time for a state switch.
  {
    switch(state)
    {
    case 1:     // in interrupt                                               // Main Frame State Ends
      state = 2;                                                              // Switch to Interrupt Preliminary state
      cycles = STATE_2_CYCLES_ARCADE;                                         // Max cycles between INT and DMAOUT.
      if (screenEnabled)                                                      // If screen is on
      {
        // Come out of IDL for Interrupt.
        if (READ(R[P]) == 0) {
          R[P]++;        
          R[P] &= 0xFFFF;
        }
        //println("inst "+instructionCycles);
        instructionCycles = 0;  // debug
        INTERRUPT();                                                        // if IE != 0 generate an interrupt.
        dmaCount = DMA_COUNT;
      }
      break;
    case 2:                                                                   // Interrupt preliminary ends.
      state = 1;                                                              // Switch to Main Frame State
      cycles = STATE_1_CYCLES_ARCADE+unusedCycles;
      unusedCycles = 0;
      SYSTEM_Command(HWC_FRAMESYNC, 0);                                        // Synchronise.
      if (toneState != 0) {
        tone(true);
      } else {
        tone(false);
      }
      break;
    } // switch
    rState = state;                                                      // Return state as state has switched
    cycles--;                                                            // Time out when cycles goes negative so deduct 1.
  }
  return rState;
}
