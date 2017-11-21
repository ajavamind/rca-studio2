// http://www.beadsproject.net/ Sound for Java and Processing
// Add this library to Processing SDK
// Processing SDK -> sketch -> Import Library -> Beads  (a library for real-time sound for Processing)
import beads.*;

// Processing SDK -> sketch -> Import Library -> Cassette  (Android library for real-time sound for Processing)
//import cassette.audiofiles.*;

AudioContext ac;
WavePlayer[] wp;
volatile Gain gain;
volatile int iFreq = 0;
volatile int prevFreq = 0;
int freq = BEEP_FREQUENCY;
float GAIN = 0.1;

void initSound() {
  if (sound) {
    ac = new AudioContext();
    wp = new WavePlayer[256];
    wp[0] = new WavePlayer(ac, BEEP_FREQUENCY, Buffer.SQUARE);
    for (int i=1; i<255; i++) {
      wp[i] = new WavePlayer(ac, float(27965/i), Buffer.SQUARE);
    }
    gain = new Gain(ac, 1, GAIN);
    gain.addInput(wp[0]);
    ac.out.addInput(gain);
    ac.start();
  }
}

void tone(boolean state) {
  if (sound) {
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

void setFreq(int val) {
  prevFreq = iFreq;
  iFreq = val;
  if (val != 0) {
    freq = 27965/val;
    //print(" F="+freq + " "+val+" ");
  }
  //else {
  //print(" F="+BEEP_FREQUENCY + " 0 ");
  //}
}