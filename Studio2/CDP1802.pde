//*******************************************************************************************************
//*******************************************************************************************************
//
//      Name:       Cpu.C
//      Purpose:    1802 Processor Emulation
//      Author:     Paul Robson
//      Date:       24th February 2013
//
//*******************************************************************************************************
//*******************************************************************************************************

/**
 * Converted to Processing/Java programming environment by Andrew Modla
 * November 2017
 *
 */
 
import java.io.*;

static int HWC_READKEYBOARD   =     0;
static int HWC_UPDATEQ        =     1;
static int HWC_FRAMESYNC      =     2;
static int HWC_SETKEYPAD      =     3;

static int CLOCK_SPEED =            (3521280/2);                                        // Clock Frequency (1,760,640Hz)
static int CYCLES_PER_SECOND   =    (CLOCK_SPEED/8);                                     // There are 8 clocks in each cycle (220,080 Cycles/Second)
static int FRAMES_PER_SECOND  =     (60);                                                // NTSC Frames Per Second
static int LINES_PER_FRAME    =     (262);                                               // Lines Per NTSC Frame
static int CYCLES_PER_FRAME   =     (CYCLES_PER_SECOND/FRAMES_PER_SECOND);               // Cycles per Frame, Complete (3668)
static int CYCLES_PER_LINE    =     (CYCLES_PER_FRAME/LINES_PER_FRAME);                  // Cycles per Display Line (14)

static int VISIBLE_LINES     =      (128);                                               // 128 visible lines per frame
static int NON_DISPLAY_LINES  =     (LINES_PER_FRAME-VISIBLE_LINES);                     // Number of non-display lines per frame. (134)
static int EXEC_CYCLES_PER_FRAME =  (NON_DISPLAY_LINES*CYCLES_PER_LINE);                 // Cycles where 1802 not generating video per frame (1876)

// Note: this means that there are 1876*60/2 approximately instructions per second, about 56,280. With an instruction rate of
// approx 8m per second, this means each instruction is limited to 8,000,000 / 56,280 * (128/312.5) about 58 AVR instructions for each
// 1802 instructions.

// State 1 : 1876 cycles till interrupt N1 = 0
// State 2 : 29 cycles with N1 = 1

static int STATE_1_CYCLES     =     (EXEC_CYCLES_PER_FRAME);
static int STATE_2_CYCLES     =     (29);

static int D,X,P,T;                                                               // 1802 8 bit registers
static int DF,IE,Q;                                                               // 1802 1 bit registers
static int[] R = new int[16];                                                     // 1802 16 bit registers
static int _temp;                                                                // Temporary register
static int Cycles;                                                                // Cycles till state switch
static int State;                                                                 // Frame position state (NOT 1802 internal state)
static int screenMemory = -1;                                                  // Current Screen Pointer (-1 = off)
static int scrollOffset;                                                          // Vertical scroll offset e.g. R0 = $nnXX at 29 cycles
static boolean screenEnabled;                                                         // Screen on (IN 1 on, OUT 1 off)
static int displayPointer;
static int keyboardLatch;                                                         // Value stored in Keyboard Select Latch (Studio 2)
static int[] studio2_4k = new int[4096];                                          // 4K RAM development space emulation
static int COLOR_MAP = 0x0B00;

/**
 * 1802 CPU State (used for debug machine state saves)
 */
class CPU1802STATE
{
    int D,DF,X,P,T,IE,Q,R[];
    int Cycles,State;
}

static String[] mnemonics = { "idl","ldn r1","ldn r2","ldn r3","ldn r4","ldn r5","ldn r6","ldn r7","ldn r8","ldn r9","ldn ra","ldn rb","ldn rc","ldn rd","ldn re","ldn rf","inc r0","inc r1","inc r2","inc r3","inc r4","inc r5","inc r6","inc r7","inc r8","inc r9","inc ra","inc rb","inc rc","inc rd","inc re","inc rf","dec r0","dec r1","dec r2","dec r3","dec r4","dec r5","dec r6","dec r7","dec r8","dec r9","dec ra","dec rb","dec rc","dec rd","dec re","dec rf","br .1","bq .1","bz .1","bdf .1","b1 .1","b2 .1","b3 .1","b4 .1","skp","bnq .1","bnz .1","bnf .1","bn1 .1","bn2 .1","bn3 .1","bn4 .1","lda r0","lda r1","lda r2","lda r3","lda r4","lda r5","lda r6","lda r7","lda r8","lda r9","lda ra","lda rb","lda rc","lda rd","lda re","lda rf","str r0","str r1","str r2","str r3","str r4","str r5","str r6","str r7","str r8","str r9","str ra","str rb","str rc","str rd","str re","str rf","irx","out 1","out 2","out 3","out 4","out 5","out 6","out 7","nop68","inp 1","inp 2","inp 3","inp 4","inp 5","inp 6","inp 7","ret","dis","ldxa","stxd","adc","sdb","rshr","smb","sav","mark","req","seq","adci .1","sdbi .1","rshl","smbi .1","glo r0","glo r1","glo r2","glo r3","glo r4","glo r5","glo r6","glo r7","glo r8","glo r9","glo ra","glo rb","glo rc","glo rd","glo re","glo rf","ghi r0","ghi r1","ghi r2","ghi r3","ghi r4","ghi r5","ghi r6","ghi r7","ghi r8","ghi r9","ghi ra","ghi rb","ghi rc","ghi rd","ghi re","ghi rf","plo r0","plo r1","plo r2","plo r3","plo r4","plo r5","plo r6","plo r7","plo r8","plo r9","plo ra","plo rb","plo rc","plo rd","plo re","plo rf","phi r0","phi r1","phi r2","phi r3","phi r4","phi r5","phi r6","phi r7","phi r8","phi r9","phi ra","phi rb","phi rc","phi rd","phi re","phi rf","lbr .2","lbq .2","lbz .2","lbdf .2","nop","lsnq","lsnz","lsnf","lskp","lbnq .2","lbnz .2","lbnf .2","lsie","lsq","lsz","lsdf","sep r0","sep r1","sep r2","sep r3","sep r4","sep r5","sep r6","sep r7","sep r8","sep r9","sep ra","sep rb","sep rc","sep rd","sep re","sep rf","sex r0","sex r1","sex r2","sex r3","sex r4","sex r5","sex r6","sex r7","sex r8","sex r9","sex ra","sex rb","sex rc","sex rd","sex re","sex rf","ldx","or","and","xor","add","sd","shr","sm","ldi .1","ori .1","ani .1","xri .1","adi .1","sdi .1","shl","smi .1"};

//*******************************************************************************************************
//                                 Macros to Read/Write memory
//*******************************************************************************************************

static int READ(int a) {return   CPU_ReadMemory(a); }
static void WRITE(int a, int d) { CPU_WriteMemory(a, d);}

//*******************************************************************************************************
//   Macros for fetching 1 + 2 BYTE8 operands, Note 2 BYTE8 fetch stores in _temp, 1 BYTE8 returns value
//*******************************************************************************************************

static int FETCH2() {
  int val = CPU_ReadMemory(R[P]++);
  R[P] &= 0xFFFF;
  return (val);
}

static void FETCH3() {   
  _temp = CPU_ReadMemory(R[P]++);
  R[P] &= 0xFFFF;
  _temp = (_temp << 8) | CPU_ReadMemory(R[P]++);
  R[P] &= 0xFFFF;
  _temp = _temp & 0xFFFF;
}

static void ADD(int n1, int n2, int n3) {
  _temp = (n1)+(n2)+(n3);
  DF = (_temp >> 8) & 01;
  D = _temp & 0xFF;
}

static void SUB(int n1, int n2, int n3) {
  _temp = (n1)+((n2) ^ 0xFF)+(n3);
  DF = (_temp >> 8) & 0x01;
  D = _temp & 0xFF;
}

static void INC(int i) {
  R[i]++;
  R[i] &= 0xFFFF;
}

static void DEC(int i) {
  R[i]--;
  R[i] &= 0xFFFF;
}

static void SHORT(int b) {  
R[P] = (R[P] & 0xFF00) | (b & 0xFF); 
}

static void LONG(int a) { 
R[P] = a & 0xFFFF;
}

static void LONGSKIP() {  
R[P] += 2; 
R[P] = R[P] & 0xFFFF;
}

static void INTERRUPT() { 
  if (IE != 0) { 
    T = ((X << 4) | P);
    P = 1; 
    X = 2; 
    IE = 0;
  }
}

static void RETURN()  { 
  _temp = READ(R[X]);
  R[X]++;
  R[X] = R[X] & 0xFFFF;
  X = (_temp >> 4) & 0xFF;
  P = _temp & 0x0F;
}

//*******************************************************************************************************
//                      Macros translating Hardware I/O to hardwareHandler calls
//*******************************************************************************************************

int READEFLAG(int n) {    
 return CPU_ReadEFlag(n);
}

void UPDATEIO(int p, int d) { 
CPU_OutputHandler(p,d); 
}

int INPUTIO(int p) {
  return CPU_InputHandler(p);
}

int CPU_ReadEFlag(int flag)
{
    int retVal = 0;
    switch (flag)
    {
        case 1:                                                                     // EF1 detects not in display
            retVal = 1;                                                             // Permanently set to '1' so BN1 in interrupts always fails
            break;
        case 3:                                                                     // EF3 detects keypressed on VIP and Elf but differently.
            SYSTEM_Command(HWC_SETKEYPAD, 1);
            retVal = SYSTEM_Command(HWC_READKEYBOARD,keyboardLatch);
            break;
        case 4:                                                                     // EF4 is !IN Button
            SYSTEM_Command(HWC_SETKEYPAD,2);
            retVal = SYSTEM_Command(HWC_READKEYBOARD,keyboardLatch);
            break;
    }
    return retVal;
}

static int CPU_InputHandler(int portID)
{
    int retVal = 0xFF;  // data bus has pull up resistors for logic 1 value
    switch (portID)
    {
        case 1:                                                                     // IN 1 turns the display on.
            screenEnabled = true;
            break;
    }
    return retVal;
}

void CPU_OutputHandler(int portID, int data)
{
    switch (portID) //<>//
    {
      // Called with 0 to set Q
        case 0:              
            SYSTEM_Command(HWC_UPDATEQ, data);                                       // Update Q Flag via HW Handler
            break;
            // OUT 1 turns the display off
        case 1:               
            if (console == STUDIO2)
              screenEnabled = false;
            break;
            // OUT 2 sets the keyboard latch (both S2 & VIP)
        case 2:                                                                     
            keyboardLatch = (data & 0x0F);                                            // Lower 4 bits only :)
            break;
    }
}

//*******************************************************************************************************
//                                              Monitor ROM
//*******************************************************************************************************

// 2048 byte studio 2 ROM image, includes interpreter (1K) and built-in games (1K)
static int[] studio2 = {144,177,180,165,171,248,8,178,182,184,248,28,161,248,191,162,248,107,164,248,3,181,212,122,66,246,66,112,34,120,34,115,192,0,35,126,82,25,248,9,176,248,208,168,139,160,226,32,160,226,32,160,226,32,160,128,32,160,60,47,32,160,56,60,40,8,50,71,255,1,88,136,251,205,58,64,8,50,23,123,48,24,25,137,174,147,190,153,238,244,86,246,230,244,185,86,69,242,86,212,0,0,226,34,105,18,212,150,183,148,188,69,172,175,246,246,246,246,50,148,249,224,172,143,250,15,249,192,166,5,246,246,246,246,249,192,167,76,179,140,252,15,172,76,163,211,48,107,143,250,15,179,69,48,144,34,226,248,211,115,69,249,240,82,230,71,210,86,248,203,166,145,126,86,212,134,251,192,58,82,66,181,66,165,212,69,86,212,100,10,1,6,58,199,21,212,6,58,194,5,165,212,21,133,34,82,149,34,82,37,69,165,134,250,15,181,212,134,250,15,186,69,170,212,0,0,0,0,0,2,0,2,0,2,0,2,0,2,1,2,0,210,202,191,196,78,185,61,155,86,217,229,175,191,0,164,248,201,167,7,254,254,254,254,166,248,208,231,244,167,248,2,188,248,146,172,220,16,15,189,220,8,15,250,15,174,15,250,128,190,7,173,37,69,246,51,78,246,51,73,246,51,61,246,51,188,248,16,175,145,86,22,47,143,58,53,212,230,142,50,60,74,243,86,22,22,46,48,62,248,204,175,15,189,157,251,2,50,99,157,251,8,50,109,157,251,4,50,151,157,251,6,50,114,212,7,255,8,87,220,24,147,245,95,212,7,252,8,48,102,142,50,249,6,246,86,59,129,158,58,129,248,128,190,29,22,6,118,86,59,147,38,6,249,128,86,22,158,50,147,145,190,29,22,46,48,114,142,50,249,6,254,86,59,165,158,50,165,145,190,45,22,6,126,86,59,184,38,6,249,1,86,22,158,58,184,248,128,190,45,22,46,48,151,147,188,248,235,172,145,175,158,50,212,45,142,50,225,220,29,220,141,252,7,173,46,48,199,142,50,225,220,45,220,141,252,9,173,46,48,212,143,58,230,21,212,5,165,212,22,211,248,9,189,237,6,242,50,244,175,6,243,93,48,233,220,32,15,255,1,95,220,8,15,250,15,95,158,241,95,141,87,212,34,249,35,195,192,47,26,37,31,56,35,39,51,41,43,96,32,32,32,112,240,16,112,16,240,128,240,16,240,128,240,144,240,144,240,16,240,144,144,144,240,16,16,16,16,160,160,240,32,32,134,250,15,50,71,230,69,244,86,212,6,255,1,58,225,21,212,69,230,243,50,77,21,21,212,150,188,7,172,69,246,51,155,246,51,106,246,51,109,246,51,112,7,48,79,12,86,212,6,92,212,230,6,191,145,190,248,188,174,44,28,145,92,14,245,59,135,86,12,252,1,92,48,124,78,246,59,121,159,86,140,87,212,239,211,150,191,135,227,244,175,19,48,144,6,87,212,35,54,226,112,158,192,69,163,10,86,212,6,90,212,74,86,212,6,90,26,212,6,170,212,6,250,15,86,230,138,241,170,212,248,203,167,134,250,15,175,251,15,58,204,7,175,226,34,143,82,98,248,202,166,6,50,219,54,221,21,212,63,217,143,87,48,226,86,5,165,212,69,90,34,226,134,250,15,82,138,244,170,18,212,145,90,138,42,58,242,212,109,2,110,10,62,253,192,109,4,169,255,2,242,168,159,2,242,0,102,168,210,178,248,177,21,179,17,177,4,177,4,177,1,177,2,177,5,176,5,163,43,105,4,121,255,228,57,36,20,0,3,3,128,24,24,24,24,24,24,24,24,232,58,19,60,232,60,192,96,15,34,249,112,63,192,105,2,108,6,96,127,34,158,35,84,108,6,226,35,84,192,108,8,96,32,34,158,192,105,3,168,211,176,3,19,78,139,255,8,171,212,105,4,137,164,35,136,98,130,147,40,224,96,2,108,6,35,150,228,226,226,226,226,226,226,112,119,35,150,228,232,135,192,98,128,130,164,147,34,192,35,136,131,20,147,36,192,162,16,147,34,243,182,243,166,243,179,114,255,192,106,1,35,104,106,0,35,104,110,127,62,173,192,106,1,35,185,106,0,35,185,192,35,136,131,21,75,184,35,61,19,193,74,200,3,203,192,3,206,192,54,203,212,55,206,212,35,104,35,143,35,104,192,210,227,212,227,214,227,216,227,107,0,192,34,11,192,97,209,105,1,242,172,146,20,232,240,112,234,192,0,34,11,146,17,35,209,97,100,35,185,23,248,106,1,209,14,210,57,211,139,212,141,213,143,20,0,105,2,104,0,109,4,232,20,106,1,210,55,106,0,37,6,20,20,75,16,91,5,20,51,110,8,62,40,56,46,232,46,36,111,226,20,20,104,255,20,18,232,57,105,2,96,130,168,48,109,4,35,195,106,0,37,6,20,67,91,5,20,67,75,88,251,175,36,111,226,232,86,112,65,176,0,109,8,168,48,252,172,76,92,36,113,226,232,103,213,107,20,94,208,94,20,107,155,193,99,1,131,194,67,138,99,5,140,53,75,133,76,138,124,2,226,108,8,192,124,8,226,108,2,192,22,3,21,19,109,4,35,195,168,208,184,131,176,5,35,163,103,21,110,48,62,159,109,3,102,12,100,255,101,255,119,255,55,175,19,191,104,0,168,130,96,3,194,3,242,175,136,36,112,181,105,0,98,132,35,114,63,205,118,255,111,32,54,205,20,249,106,1,37,6,20,225,155,33,68,225,109,2,130,131,66,245,100,0,20,225,106,0,37,6,20,195,155,33,69,195,109,2,130,131,66,245,101,0,20,195,150,17,35,209,105,0,232,157,20,157,66,181,66,165,21,21,212,107,10,123,255,223,15,59,8,192,109,2,4,255,165,227,96,8,35,230,168,208,177,9,183,178,177,7,176,8,165,235,105,0,37,217,37,217,100,10,103,18,101,120,99,32,104,32,109,32,102,6,96,10,168,129,106,1,208,75,106,0,208,71,21,61,176,1,21,77,176,3,106,1,210,133,216,137,106,0,212,179,214,179,62,97,69,97,117,255,110,60,63,77,115,255,144,128,21,119,109,2,136,5,75,115,120,254,21,117,120,2,136,4,51,141,97,1,35,143,99,16,53,141,35,104,19,191,96,0,21,83,96,10,21,83,105,1,108,2,37,203,152,241,3,99,71,173,150,193,105,0,168,129,242,166,203,255,130,178,66,77,37,203,119,255,21,77,37,250,103,18,21,77,155,193,92,4,21,197,84,21,21,89,116,1,105,1,37,203,21,89,68,195,116,255,21,191,232,205,226,5,224,232,211,192,104,26,109,4,21,210,224,228,232,221,121,1,192,60,224,212,0,64,128,192,4,68,132,196,180,252,180,48,180,252,180,16,186,254,186,56,186,254,186,98,4,86,4,98,6,146,97,192,100,0,168,219,176,5,39,65,116,1,84,11,22,27,102,1,38,41,102,0,38,41,22,9,35,104,106,1,35,104,167,134,103,155,38,148,19,191,103,125,70,47,103,121,167,144,39,78,119,1,98,112,148,40,96,1,39,70,35,117,168,219,176,5,35,163,150,161,39,65,168,32,176,128,168,210,184,248,176,1,35,68,102,0,105,1,168,217,176,4,167,84,224,228,167,88,96,10,35,230,168,96,96,10,177,1,112,107,38,190,81,0,38,177,81,10,22,155,134,20,38,190,134,20,81,0,38,177,86,10,22,169,111,95,63,137,39,65,150,17,35,143,192,103,193,39,78,119,1,39,78,192,167,104,102,20,38,146,96,4,34,249,112,163,22,135,167,114,102,15,38,146,22,135,167,124,38,146,111,63,63,183,167,124,38,146,192,105,0,168,208,184,8,184,6,184,6,184,0,176,56,167,98,224,228,101,24,232,212,85,24,108,8,85,0,108,2,63,239,92,2,117,1,92,8,117,255,207,4,127,0,232,236,226,22,210,210,249,216,249,213,247,22,220,107,0,155,129,109,6,108,0,97,0,105,0,63,3,92,2,117,1,92,8,117,255,232,15,225,225,226,232,24,111,7,23,38,105,1,103,10,119,255,151,129,39,149,51,203,55,28,85,25,23,60,85,255,23,60,168,240,243,166,83,0,23,60,83,30,152,193,23,1,105,0,232,64,192,169,255,2,242,192,105,3,99,211,151,52,224,192,39,70,228,232,83,192,60,36,36,60,215,151,87,23,182,118,54,149,85,116,63,63,63,63,63,63,238,132,229,36,228,119,21,117,69,119,238,138,238,40,232,103,36,167,33,119,125,85,85,69,69,119,68,119,17,119,246,134,229,132,244,95,73,73,201,223,60,32,56,32,32,98,96,130,132,147,34,192,167,88,98,88,130,132,242,179,243,166,98,209,147,36,192,109,2,98,96,130,132,99,0,147,36,113,1,110,4,62,185,192,195,1,67,202,39,149,67,202,39,156,232,200,39,171,192,39,156,232,207,232,211,23,36,232,213,39,171,87,5,23,243,87,2,23,229,87,1,23,229,23,36,76,227,104,0,96,4,39,188,120,1,112,235,23,36,76,241,104,6,39,188,104,4,39,188,23,36,187};

//*******************************************************************************************************
//                          Reset the 1802 and System Handlers
//*******************************************************************************************************

void CPU_Reset()
{
  X = 0;
  P = 0;
  Q = 0;
  R[0] = 0;                                                           // Reset 1802 - Clear X,P,Q,R0
  IE = 1;                                                                         // Set IE to 1
  DF = DF & 1;                                                                    // Make DF a valid value as it is 1-bit.

    State = 1;                                                                      // State 1
    Cycles = STATE_1_CYCLES;                                                        // Run this many cycles.
    screenEnabled = false;
                                                                         // PC Version copy code into 4k space.
    for (int i = 0;i < 2048;i++) studio2_4k[i] = studio2[i];
    if (console == STUDIO3) {
      for (int i = 0; i<64; i++) {
        studio2_4k[0x0B00+i] = WHITE;
      }
    }
}


//*******************************************************************************************************
//                                        Read a byte in memory
//*******************************************************************************************************

static int CPU_ReadMemory(int address)
{
    if (address >= 0x1000) {
      return 0xFF;
    }
    //address &= 0xFFF;
    return studio2_4k[address] & 0xFF;
}

//*******************************************************************************************************
//                                          Write a byte in memory
//*******************************************************************************************************

static void CPU_WriteMemory(int address, int data)
{
    //address = address & 0xFFF;
    if (address >= 0x800 && address < 0xA00)                                    // only RAM space is writeable
    {
        studio2_4k[address] = data & 0xFF;
    }
    else if ((console == STUDIO3) && address >= 0xB00 && address <0xB40) {
      studio2_4k[address] = data & 0xFF;
      //println("write color map memory "+ hex(address) + " value="+(data&0xFF));
    }
    else {
      println("Attempt to write ROM memory "+hex(address));
    }
}

//*******************************************************************************************************
//                                         Execute one instruction
//*******************************************************************************************************

int CPU_Execute()
{
    int rState = 0;
    int addr = R[P]++;
    R[P] &= 0xFFFF;
    int opCode = CPU_ReadMemory(addr) & 0xFF;
    //println("P= "+hex(R[P]-1)+" opCode="+hex(opCode));
    Cycles -= 2;                                                                    // 2 x 8 clock Cycles - Fetch and Execute.
    switch(opCode)                                                                  // Execute dependent on the Operation Code
    {
/* GENERATED */

case 0x00: /* "idl" */
    R[P]--;
    R[P] &= 0xFFFF;
    break;
case 0x01: /* "ldn r1" */
    D = READ(R[1]);
    break;
case 0x02: /* "ldn r2" */
    D = READ(R[2]);
    break;
case 0x03: /* "ldn r3" */
    D = READ(R[3]);
    break;
case 0x04: /* "ldn r4" */
    D = READ(R[4]);
    break;
case 0x05: /* "ldn r5" */
    D = READ(R[5]);
    break;
case 0x06: /* "ldn r6" */
    D = READ(R[6]);
    break;
case 0x07: /* "ldn r7" */
    D = READ(R[7]);
    break;
case 0x08: /* "ldn r8" */
    D = READ(R[8]);
    break;
case 0x09: /* "ldn r9" */
    D = READ(R[9]);
    break;
case 0x0a: /* "ldn ra" */
    D = READ(R[10]);
    break;
case 0x0b: /* "ldn rb" */
    D = READ(R[11]);
    break;
case 0x0c: /* "ldn rc" */
    D = READ(R[12]);
    break;
case 0x0d: /* "ldn rd" */
    D = READ(R[13]);
    break;
case 0x0e: /* "ldn re" */
    D = READ(R[14]);
    break;
case 0x0f: /* "ldn rf" */
    D = READ(R[15]);
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
    _temp = FETCH2();SHORT(_temp);
    break;
case 0x31: /* "bq .1" */
    _temp = FETCH2(); if ((Q != 0)) SHORT(_temp);
    break;
case 0x32: /* "bz .1" */
    _temp = FETCH2(); if ((D == 0)) SHORT(_temp);
    break;
case 0x33: /* "bdf .1" */
    _temp = FETCH2(); if ((DF != 0)) SHORT(_temp);
    break;
case 0x34: /* "b1 .1" */
    _temp = FETCH2(); if ((READEFLAG(1) != 0)) SHORT(_temp);
    break;
case 0x35: /* "b2 .1" */
    _temp = FETCH2(); if ((READEFLAG(2) != 0)) SHORT(_temp);
    break;
case 0x36: /* "b3 .1" */
    _temp = FETCH2(); if ((READEFLAG(3) != 0)) SHORT(_temp);
    break;
case 0x37: /* "b4 .1" */
    _temp = FETCH2(); if ((READEFLAG(4) != 0)) SHORT(_temp);
    break;
case 0x38: /* "skp" */
    _temp = FETCH2();
    break;
case 0x39: /* "bnq .1" */
    _temp = FETCH2(); if (!((Q != 0))) SHORT(_temp);
    break;
case 0x3a: /* "bnz .1" */
    _temp = FETCH2(); if (!((D == 0))) SHORT(_temp);
    break;
case 0x3b: /* "bnf .1" */
    _temp = FETCH2(); if (!((DF != 0))) SHORT(_temp);
    break;
case 0x3c: /* "bn1 .1" */
    _temp = FETCH2(); if (!((READEFLAG(1) != 0))) SHORT(_temp);
    break;
case 0x3d: /* "bn2 .1" */
    _temp = FETCH2(); if (!((READEFLAG(2) != 0))) SHORT(_temp);
    break;
case 0x3e: /* "bn3 .1" */
    _temp = FETCH2(); if (!((READEFLAG(3) != 0))) SHORT(_temp);
    break;
case 0x3f: /* "bn4 .1" */
    _temp = FETCH2(); if (!((READEFLAG(4) != 0))) SHORT(_temp);
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
    WRITE(R[0],D);
    break;
case 0x51: /* "str r1" */
    WRITE(R[1],D);
    break;
case 0x52: /* "str r2" */
    WRITE(R[2],D);
    break;
case 0x53: /* "str r3" */
    WRITE(R[3],D);
    break;
case 0x54: /* "str r4" */
    WRITE(R[4],D);
    break;
case 0x55: /* "str r5" */
    WRITE(R[5],D);
    break;
case 0x56: /* "str r6" */
    WRITE(R[6],D);
    break;
case 0x57: /* "str r7" */
    WRITE(R[7],D);
    break;
case 0x58: /* "str r8" */
    WRITE(R[8],D);
    break;
case 0x59: /* "str r9" */
    WRITE(R[9],D);
    break;
case 0x5a: /* "str ra" */
    WRITE(R[10],D);
    break;
case 0x5b: /* "str rb" */
    WRITE(R[11],D);
    break;
case 0x5c: /* "str rc" */
    WRITE(R[12],D);
    break;
case 0x5d: /* "str rd" */
    WRITE(R[13],D);
    break;
case 0x5e: /* "str re" */
    WRITE(R[14],D);
    break;
case 0x5f: /* "str rf" */
    WRITE(R[15],D);
    break;
case 0x60: /* "irx" */
    R[X]++;
    R[X] &= 0xFFFF;
    break;
case 0x61: /* "out 1" */
    UPDATEIO(1,READ(R[X])); //<>//
    R[X]++;
    R[X] &= 0xFFFF;
    if (console == STUDIO3) {
      backgroundColor++;
      if (backgroundColor >= bgColor.length)
        backgroundColor = 0;
    }
    break;
case 0x62: /* "out 2" */
    UPDATEIO(2,READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
case 0x63: /* "out 3" */
    UPDATEIO(3,READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
case 0x64: /* "out 4" */
    UPDATEIO(4,READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
case 0x65: /* "out 5" */
    UPDATEIO(5,READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
case 0x66: /* "out 6" */
    UPDATEIO(6,READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
case 0x67: /* "out 7" */
    UPDATEIO(7,READ(R[X]));
    R[X]++;
    R[X] &= 0xFFFF;
    break;
case 0x68: /* "nop68" */
    Cycles--;
    break;
case 0x69: /* "inp 1" */
    D = INPUTIO(1);WRITE(R[X],D);
    break;
case 0x6a: /* "inp 2" */
    D = INPUTIO(2);WRITE(R[X],D);
    break;
case 0x6b: /* "inp 3" */
    D = INPUTIO(3);WRITE(R[X],D);
    break;
case 0x6c: /* "inp 4" */
    D = INPUTIO(4);WRITE(R[X],D);
    break;
case 0x6d: /* "inp 5" */
    D = INPUTIO(5);WRITE(R[X],D);
    break;
case 0x6e: /* "inp 6" */
    D = INPUTIO(6);WRITE(R[X],D);
    break;
case 0x6f: /* "inp 7" */
    D = INPUTIO(7);WRITE(R[X],D);
    break;
case 0x70: /* "ret" */
    RETURN();IE = 1;
    break;
case 0x71: /* "dis" */
    RETURN();IE = 0;
    break;
case 0x72: /* "ldxa" */
    D = READ(R[X]);
    R[X]++;
    R[X] &= 0xFFFF;
    break;
case 0x73: /* "stxd" */
    WRITE(R[X],D);
    R[X]--;
    R[X] &= 0xFFFF;
    break;
case 0x74: /* "adc" */
    ADD(D,READ(R[X]),DF);
    break;
case 0x75: /* "sdb" */
    SUB(READ(R[X]),D,DF);
    break;
case 0x76: /* "rshr" */
    _temp = D & 1;
    D = (((D >> 1) & 0x7F) | (DF << 7)) & 0xFF;
    DF = _temp;
    break;
case 0x77: /* "smb" */
    SUB(D,READ(R[X]),DF);
    break;
case 0x78: /* "sav" */
    WRITE(R[X],T);
    break;
case 0x79: /* "mark" */
    T = ((X << 4) | P) & 0xFF;
    WRITE(R[2],T);
    X = P;
    R[2]--;
    R[2] &= 0xFFFF;
    break;
case 0x7a: /* "req" */
    Q = 0;UPDATEIO(0,0);
    break;
case 0x7b: /* "seq" */
    Q = 1;UPDATEIO(0,1);
    break;
case 0x7c: /* "adci .1" */
    ADD(D,FETCH2(),DF);
    break;
case 0x7d: /* "sdbi .1" */
    SUB(FETCH2(),D,DF);
    break;
case 0x7e: /* "rshl" */
    // _temp = D;D = (D << 1) | DF;DF = (_temp >> 7) & 1;
    _temp = D;
    D = ((D << 1) | DF) & 0xFF;
    DF = (_temp >> 7) & 1;
    break;
case 0x7f: /* "smbi .1" */
    SUB(D,FETCH2(),DF);
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
    Cycles--;FETCH3();LONG(_temp);
    break;
case 0xc1: /* "lbq .2" */
    Cycles--;FETCH3();if ((Q != 0)) LONG(_temp);
    break;
case 0xc2: /* "lbz .2" */
    Cycles--;FETCH3();if ((D == 0)) LONG(_temp);
    break;
case 0xc3: /* "lbdf .2" */
    Cycles--;FETCH3();if ((DF != 0)) LONG(_temp);
    break;
case 0xc4: /* "nop" */
    Cycles--;
    break;
case 0xc5: /* "lsnq" */
    Cycles--;if (!(Q != 0)) LONGSKIP();
    break;
case 0xc6: /* "lsnz" */
    Cycles--;if (!(D == 0)) LONGSKIP();
    break;
case 0xc7: /* "lsnf" */
    Cycles--;if (!(DF != 0)) LONGSKIP();
    break;
case 0xc8: /* "lskp" */
    Cycles--;FETCH3();
    break;
case 0xc9: /* "lbnq .2" */
    Cycles--;FETCH3();if (!((Q != 0))) LONG(_temp);
    break;
case 0xca: /* "lbnz .2" */
    Cycles--;FETCH3();if (!((D == 0))) LONG(_temp);
    break;
case 0xcb: /* "lbnf .2" */
    Cycles--;FETCH3();if (!((DF != 0))) LONG(_temp);
    break;
case 0xcc: /* "lsie" */
    Cycles--;if (IE != 0) LONGSKIP();
    break;
case 0xcd: /* "lsq" */
    Cycles--;if (((Q != 0))) LONGSKIP();
    break;
case 0xce: /* "lsz" */
    Cycles--;if (((D == 0))) LONGSKIP();
    break;
case 0xcf: /* "lsdf" */
    Cycles--;if (((DF != 0))) LONGSKIP();
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
    ADD(D,READ(R[X]),0);
    break;
case 0xf5: /* "sd" */
    SUB(READ(R[X]),D,1);
    break;
case 0xf6: /* "shr" */
    DF = D & 1;
    D = (D >> 1) & 0x7F;
    break;
case 0xf7: /* "sm" */
    SUB(D,READ(R[X]),1);
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
    ADD(D,FETCH2(),0);
    break;
case 0xfd: /* "sdi .1" */
    SUB(FETCH2(),D,1);
    break;
case 0xfe: /* "shl" */
    DF = (D >> 7) & 1; 
    D = (D << 1) & 0xFF;
    break;
case 0xff: /* "smi .1" */
    SUB(D,FETCH2(),1);
    break;
    } // switch
    
    if (Cycles < 0)                                                                 // Time for a state switch.
    {
        switch(State)
        {
        case 1:                                                                     // Main Frame State Ends
            State = 2;                                                              // Switch to Interrupt Preliminary state
            Cycles = STATE_2_CYCLES;                                                // The 29 cycles between INT and DMAOUT.
            if (screenEnabled)                                                      // If screen is on
            {
                if (CPU_ReadMemory(R[P]) == 0) R[P]++;                              // Come out of IDL for Interrupt.
                INTERRUPT();                                                        // if IE != 0 generate an interrupt.
            }
            break;
        case 2:                                                                     // Interrupt preliminary ends.
            State = 1;                                                              // Switch to Main Frame State
            Cycles = STATE_1_CYCLES;
            screenMemory = (R[0] & 0xFF00) ;                               // space for PC version
            scrollOffset = R[0] & 0xFF;                                             // Get the scrolling offset (for things like the car game)
            SYSTEM_Command(HWC_FRAMESYNC,0);                                        // Synchronise.
            break;
        } // switch
        rState = State;                                                      // Return state as state has switched
        Cycles--;                                                                   // Time out when cycles goes -ve so deduct 1.
    }
    return rState;
}

//*******************************************************************************************************
//                                              Access CPU State
//*******************************************************************************************************

CPU1802STATE CPU_ReadState(CPU1802STATE s)
{
    int i;
    s.D = D;s.DF = DF;s.X = X;s.P = P;s.T = T;s.IE = IE;s.Q = Q;
    s.Cycles = Cycles;s.State = State;
    for (i = 0;i < 16;i++) s.R[i] = R[i];
    return s;
}

//*******************************************************************************************************
//                         Get Current Screen Memory Base Address (ignoring scrolling)
//*******************************************************************************************************

int CPU_GetScreenMemoryAddress()
{
    if (scrollOffset != 0)
    {
        scrollOffset *= 1;
    }
    return (screenEnabled) ? screenMemory : -1;
}

//*******************************************************************************************************
//                               Get Current Screen Memory Scrolling Offset
//*******************************************************************************************************

int CPU_GetScreenScrollOffset()
{
    return scrollOffset;
}

//*******************************************************************************************************
//                                        Get Program Counter value
//*******************************************************************************************************

int CPU_ReadProgramCounter()
{
    return R[P];
}

/**
 * Verify 1802 Register Emulation
 * Processing uses 32 bits for int data type
 * Check for register size data overflow
 */
void verifyRegisters() {
  // 16 bit registers
   for (int i=0; i<16; i++) {
     if ((R[i] & 0xFFFF0000) != 0) {
       println("reg R["+i+"] overflow "+ hex(R[i]) + " at " + hex(R[P]));
     }
   }
   // 8 bit registers
   if ((D & 0xFFFFFF00) != 0) {
     println("reg D overflow "+ hex(D) + " at " + hex(R[P]));
   }
   if ((X & 0xFFFFFF00) != 0) {
     println("reg X overflow "+ hex(X) + " at " + hex(R[P]));
   }
   if ((P & 0xFFFFFF00) != 0) {
     println("reg P overflow "+ hex(P) + " at " + hex(R[P]));
   }
   if ((T & 0xFFFFFF00) != 0) {
     println("reg T overflow "+ hex(T) + " at " + hex(R[P]));
   }
   // 1 bit registers
   if ((DF & 0xFFFFFFFE) != 0) {
     println("reg DF overflow "+ hex(DF) + " at " + hex(R[P]));
   }
   if ((IE & 0xFFFFFFFE) != 0) {
     println("reg IE overflow "+ hex(IE) + " at " + hex(R[P]));
   }
   if ((Q & 0xFFFFFFFE) != 0) {
     println("reg Q overflow "+ hex(Q) + " at " + hex(R[P]));
   }
}

void verifyRAMmemory() {
   for (int i=0x800; i<0xA00; i++)  {
     if ((studio2_4k[i] & 0xFFFFFF00) != 0) {
       println("RAM location hex(i) overflow "+ hex(studio2_4k[i]) + " at 0x" + hex(R[P]));
     }
   }
}