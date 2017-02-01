
import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioPlayer play;
AudioInput in;
ArrayList<Skeleton> skeletor = new ArrayList<Skeleton>();
BeatDetect beat;
//this is the undulating box sphere thing
Box box;
float zm = 100;

void setup() {
 size(1050,750, P3D);
  beat = new BeatDetect();
  skeletor.add( new Skeleton(10,20) );
  minim = new Minim(this);
  box = new Box();
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}


void mousePressed(){
    skeletor.add(new Skeleton(10,random(0,400)));
    directionalLight(random(0,255),random(0,255),random(0,255),0,-1,0);
    box.onOff();
}

void draw() {
  //this should only display if it has been switched on by mouse press
  box.display();
  beat.detect(in.mix);
  
  float sp = 0.001 * frameCount;
  camera(zm * cos(sp), zm * sin(sp), zm * sin(sp), 0, 0, 0, 0, 0, -1);
  for(Skeleton s : skeletor){
    s.display(in.left.get(1000)*10,in.left.get(300)*6);
  }
  if ( beat.isOnset() ){
    for(Skeleton s : skeletor){
      s.changePoints(in.left.get(int(random(0,100))),in.right.get(int(random(0,100))));
    }
  }

}