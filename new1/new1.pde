
import ddf.minim.*;
import ddf.minim.analysis.*;
BeatDetect beat; //this is really sweet. for detecting when something is on beat!! trigger actions by rhythms
//this is the undulating box sphere thing
Box box;
Minim minim; //minim is a library for working with sound
AudioPlayer play; //for playing sounds
AudioInput in; //this grabs the line in for the device, so we can analyze sounds heard with the computer
CamController cam =  new CamController();
//Now, we're using my custom class, Skeleton. We're making an array of Skeletons so we can have more than 
//one Skeleton object on the window.
ArrayList<Skeleton> skeletor = new ArrayList<Skeleton>(); //we start by initializing the ArrayList that will hold skeltons 

ArrayList<String> keys= new ArrayList<String>(); //for checking user's key presses


void setup() {
 size(1050,750, P3D);
  //we declared all these above so that they're global, but we initialize them below
  beat = new BeatDetect();
  //skeletor.add( new Skeleton(10,10) ); //push a skeleton into the arraylist
  minim = new Minim(this);
  box = new Box();
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}


void mousePressed(){
    //skeletor.add(new Skeleton(10,random(0,400))); //everytime the mouse is pressed add a new skeleton
    directionalLight(random(0,255),random(0,255),random(0,255),0,-1,0); // and a new light source
    box.onOff(); // the box object has a method that allows us to turn it on or off manually
    //so every click will switch it between on and off.
}

void draw() {
  //this should only display if it has been switched on by mouse press
  box.display();
  beat.detect(in.mix);//feed the beat detector the line in 
  
  cam.doCam(frameCount);
  
  /*now for each skeleton in the ArrayList, display!
  for(Skeleton s : skeletor){
    s.display(in.left.get(1000)*10,in.left.get(300)*6);
  }
  
  //play with our beat checker! if the beat is on, go through all skeletons and move their points.
  if ( beat.isOnset() ){
    for(Skeleton s : skeletor){
      s.changePoints(in.left.get(30),in.right.get(70));
    }
  }*/

}

  void checkKeys(CamController cam){
    
    //should probably make a switch statement. but, whatever
    if(keys.get(0) == "growScale"){
        box.growScale();
      } else if(keys.get(0) == "shrinkScale"){
        box.shrinkScale();
     } else if(keys.get(0) == "growBox"){
       box.growBox();
     } else if (keys.get(0) == "shrinkBox"){
       box.shrinkBox();
     } else if (keys.get(0) == "up"){
       cam.zoomIn();
     } else if (keys.get(0) == "down"){
       cam.zoomOut();
     } else if (keys.get(0) == "left"){
       cam.lessSpin();
     } else if (keys.get(0) == "right"){
       cam.moreSpin();
     }
  }

  void keyReleased(){
    keys = null;
  }

  void keyPressed() {
      keys = new ArrayList<String>();
      //this value will end up being at the end of the ArrayList,
      //cause we will push stuff in afterwards
      if (key == 's') {
         keys.add( "shrinkScale" );
      }  else if (key == 'd') {
         keys.add( "growScale" );
      } else if (key == 'b'){
         keys.add( "growBox" );
      } else if (key == 'v'){
         keys.add("shrinkBox");
      } else if (key == CODED) {
        if (keyCode == UP) {
          keys.add("up");
        } else if (keyCode == DOWN) {
           keys.add("down");
        } else if (keyCode == LEFT) {
           keys.add("left");
        } else if (keyCode == RIGHT) {
           keys.add("right");
        }
     }
      
      else return;
      checkKeys(cam);
  }
  
