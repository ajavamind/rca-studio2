// Android only Java code

// https://forum.processing.org/two/discussion/2331/generate-waveform-in-processing-for-android

// remove comments for Android
/*
 import android.media.*;
 import android.content.res.*;
 */
public class PlaySound {
  private final int sampleRate = 8000;
  private final int numSamples = sampleRate;
  private final double samples[] = new double[numSamples];
  private final byte generatedSnd[] = new byte[2*(numSamples)];
  /* uncomment for Android
  final AudioTrack audioTrack = new AudioTrack(AudioManager.STREAM_MUSIC, 
   sampleRate, AudioFormat.CHANNEL_CONFIGURATION_MONO, 
   AudioFormat.ENCODING_PCM_16BIT, numSamples, 
   AudioTrack.MODE_STATIC);
   */
  void genTone(double freqOfTone) {
    // fill out the array
    for (int i = 0; i < numSamples; ++i) {
      samples[i] = Math.sin(2 * Math.PI * i / (sampleRate/freqOfTone));
    }
    // convert to 16 bit pcm sound array
    // assumes the sample buffer is normalised.
    int idx = 0;
    for (double dVal : samples) {
      // scale to maximum amplitude
      short val = (short) ((dVal * 32767));
      // in 16 bit wav PCM, first byte is the low order byte
      generatedSnd[idx++] = (byte) (val & 0x00ff);
      generatedSnd[idx++] = (byte) ((val & 0xff00) >>> 8);
    }
    /*
    audioTrack.setVolume(0.0);
     audioTrack.setPlaybackHeadPosition(0);
     if (audioTrack.getPlayState() == AudioTrack.PLAYSTATE_PLAYING ) {
     audioTrack.flush();
     audioTrack.pause();
     }
     audioTrack.write(generatedSnd, 0, numSamples*2);
     audioTrack.setLoopPoints(0, numSamples/2, -1);
     if (audioTrack.getPlayState() != AudioTrack.PLAYSTATE_PLAYING ) {
     audioTrack.play();
     }
//     */
  }

  void playSound(boolean on) {
    if (on) {
      /*
       audioTrack.setVolume(1.0);
       */
    } else {
      /*
      audioTrack.setVolume(0.0);
       */
    }
  }
}