import ddf.minim.*;
import ddf.minim.analysis.*;

class Sound{
    BeatDetect beat; //this is really sweet. for detecting when something is on beat!! trigger actions by rhythm
    Minim minim;
    AudioInput in; //this grabs the line in for the device, so we can analyze sounds heard with the computer
    AudioPlayer sound;
    FFT fft;
    
    //CONSTRUFICATOR
    Sound(Minim minim){
      in = minim.getLineIn();
      beat = new BeatDetect();
      sound = minim.loadFile(dataPath("sketchdrumLoop.wav"),2048); //for playing sounds
      sound.loop();
      fft = new FFT(sound.bufferSize(),sound.sampleRate());
    }
    
    boolean detect(){
      beat.detect(in.mix);//feed the beat detector the line in 
       //play with our beat checker! if the beat is on, go through all skeletons and move their points.
      if ( beat.isOnset() ){
        return true;
      } else return false;
    }
    
    void loop(){
      sound.loop();
    }
}