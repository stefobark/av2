
import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim; //minim is a library for working with sound
AudioPlayer play; //for playing sounds
AudioInput in; //this grabs the line in for the device, so we can analyze sounds heard with the computer
//Now, we're using my custom class, Skeleton. We're making an array of Skeletons so we can have more than 
//one Skeleton object on the window.
ArrayList<Skeleton> skeletor = new ArrayList<Skeleton>(); //we start by initializing the ArrayList that will hold skeltons 
BeatDetect beat; //this is really sweet. for detecting when something is on beat!! trigger actions by rhythms
//this is the undulating box sphere thing
Box box;

//we use this later, for the camera's zoom base
float zm = 100;

void setup() {
 size(1050,750, P3D);
  //we declared all these above so that they're global, but we initialize them below
  beat = new BeatDetect();
  skeletor.add( new Skeleton(10,10) ); //push a skeleton into the arraylist
  minim = new Minim(this);
  box = new Box();
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}


void mousePressed(){
    skeletor.add(new Skeleton(10,random(0,400))); //everytime the mouse is pressed add a new skeleton
    directionalLight(random(0,255),random(0,255),random(0,255),0,-1,0); // and a new light source
    box.onOff(); // the box object has a method that allows us to turn it on or off manually
    //so every click will switch it between on and off.
}

void draw() {
  //this should only display if it has been switched on by mouse press
  box.display();
  beat.detect(in.mix);//feed the beat detector the line in 
  
  //camera spin value
  float sp = 0.001 * frameCount;
  //camera stuff-- i want to move this into its own class
  camera(zm * cos(sp), zm * sin(sp), zm * sin(sp), 0, 0, 0, 0, 0, -1);
  
  
  //now for each skeleton in the ArrayList, display!
  for(Skeleton s : skeletor){
    s.display(in.left.get(1000)*10,in.left.get(300)*6);
  }
  
  //play with our beat checker! if the beat is on, go through all skeletons and move their points.
  if ( beat.isOnset() ){
    for(Skeleton s : skeletor){
      s.changePoints(in.left.get(30),in.right.get(70));
    }
  }

}
