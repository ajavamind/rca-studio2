/*
Note: this license does not apply to  the Studio 2 ROM or game images, nor the RCA Databooks and Datasheets. 
The License applies to the new work only.

MIT License

Copyright (c) 2017-2018 Andrew Modla
portions Copyright (c) 2016 paulscottrobson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

//
// http://www.beadsproject.net/ Sound for Java and Processing
// Add this library to Processing SDK
// Processing SDK -> sketch -> Import Library -> Beads  (a library for real-time sound for Processing)
import beads.*;

// Processing SDK -> sketch -> Import Library -> Cassette  (Android library for real-time sound for Processing)
//import cassette.audiofiles.*;

//import processing.sound.*;

/////////////////////////////////
AudioContext ac;
WavePlayer[] wp;
volatile Gain gain;
volatile static int iFreq = 0;
volatile static int prevFreq = 0;
static int freq = BEEP_FREQUENCY;
static float GAIN = 0.1;
/////////////////////////////////

static PlaySound player;

/////////////////////////////////

void initSound() {
  if (sound) {
    if (android) {
      player = new PlaySound();
      player.genTone(BEEP_FREQUENCY);
    } else {
      ac = new AudioContext();
      wp = new WavePlayer[256];
      wp[0] = new WavePlayer(ac, BEEP_FREQUENCY, Buffer.SQUARE);
      for (int i=1; i<256; i++) {
        wp[i] = new WavePlayer(ac, float(27965/i), Buffer.SQUARE);
      }
      gain = new Gain(ac, 1, GAIN);
      gain.addInput(wp[0]);
      ac.out.addInput(gain);
      ac.start();
    }
  }
}

void tone(boolean state) {
  if (sound) {
    if (android) {
      if (state) {
        player.playSound(true);
      } else {
        player.playSound(false);
      }
    } else {
      if (state) {
        if (iFreq != prevFreq) {
          gain.removeAllConnections((UGen)gain.getConnectedInputs().toArray()[0]);
          gain.addInput(wp[iFreq]);
        }
        gain.setGain(GAIN);
      } else {
        // tone off
        gain.setGain(0);
      }
      gain.update();
    }
  }
}

static void setFreq(int val) {
  prevFreq = iFreq;
  iFreq = val;
  if (val != 0) {
    freq = 27965/val;
    //print(" freq="+freq + " "+val+" ");
  } else {
    freq = BEEP_FREQUENCY;
    //print(" freq="+BEEP_FREQUENCY + " 0 ");
  }
  if (android) {
    player.genTone(freq);
  }
}