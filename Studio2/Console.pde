//
// MIT License
//
// Copyright (c) 2018 Andrew Modla
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
 * Define hardware specific console parameters
 */
 class Console {
   int type;
   int clockSpeed;  // Hz
   static final int R_32x32 = 0;
   static final int R_32x64 = 1;
   static final int R_64x32 = 2;
   static final int R_64x64 = 3;
   static final int R_64x128 = 4;
   int display; // display resolution
   static final int NTSC = 0;
   static final int PAL = 1;
   int visibleLinesPerFrame;
   int ramSize;
   int videoRAMSize;
   
   public Console() {
   }
   
   public Console(int type, int clock, int ramAddr, int ramSize, int videoRAMAddr, int videoRAMSize, int display) {
     
   }
   
 }