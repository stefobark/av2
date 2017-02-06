
CamController cam =  new CamController();
//Now, we're using my custom class, Skeleton. We're making an array of Skeletons so we can have more than 
//one Skeleton object on the window.
ArrayList<Skeleton> skeletor = new ArrayList<Skeleton>(); //we start by initializing the ArrayList that will hold skeltons 
ArrayList<String> keys= new ArrayList<String>(); //for checking user's key presses
Sound noisey; 
Minim minim;
Box box;
int red, green, blue;


void setup() {
 size(1050,750, P3D);
  skeletor.add( new Skeleton(40,20) ); //push a skeleton into the arraylist.. we can have many skeletons
  box = new Box();
  minim = new Minim(this);
  noisey = new Sound(minim);
  smooth();
}

void draw() {
  
  
  directionalLight(red,green,blue,0,-1,0);
  directionalLight(red,green,blue,1,-1,0); // and a new light source

  //this should only display if it has been switched on by mouse press
  box.display();
  //all our sound stuff
  if(noisey.detect()){
    if(red < 255){
        red += 10;
        green += 10;
        blue += 10;
      } else {
        red = 0;
        green = 0; 
        blue = 0;
      }
     for(Skeleton s : skeletor){
        s.changePoints();
      }
  }
  cam.doCam(frameCount);
  
  //now for each skeleton in the ArrayList, display!
  for(Skeleton s : skeletor){
    s.display(100,100);
  }
}  
 
void mousePressed(){
    box.onOff(); // the box object has a method that allows us to turn it on or off manually
    //so every click will switch it between on and off.
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
