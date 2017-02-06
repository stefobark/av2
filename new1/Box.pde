//using daves awesome toolkit for this nice globe box thing
//so we include the library
import dawesometoolkit.*;
//and we initialize it!
DawesomeToolkit dawesome = new DawesomeToolkit(this);

//we're doing this before defining the class.. is that bad? it should then be super duper global..
//would that then mean that all Box objects would share the same instantance of DawesomeToolkit? 
//hmmm, gotta look into that more

class Box {
  float boxSize = 10; //give it a size
  ArrayList<PVector> vectors; //here is another ArrayList, this time with Processing's vector type--
  //which is super handy for movement and all things to do with vector math
  float scaler = 1;
  boolean onOff = false; //here is the variable i use to determine 
  //whether or not the visualization should be displayed
  
  Box(){
    vectors = dawesome.fibonacciSphereLayout(100,100); //a preset visualization! a sphere of cubes
  }
  
  //our onOff switch
  void onOff(){
    //if its on, then switch it off
    if(onOff == true){
      onOff = false;
    //but if its off, turn it on!
    } else {
      onOff = true;
    }
  }
  
  void display(){
    //here is where onOff becomes relevant-- before display() does anything we check if the 
    //Box is on or off. If off, there will be no display.
    if(onOff == true){
      stroke(0,0,0,10); //setting stroke properties: color (rgb) and alpha (transparency)
      fill(255,255,255,10); //setting the same properties for the fill
      for (PVector p : vectors) {
        pushMatrix();
        p = PVector.mult(p,scaler);
        translate(p.x, p.y, p.z);
        PVector polar = dawesome.cartesianToPolar(p);
        rotateY(polar.y);
        rotateZ(polar.z);
        box(boxSize,boxSize,boxSize);
        popMatrix();
      } 
    }
  }
  
  void growScale(){
    scaler += .011;
  }
  
  void shrinkScale(){
    scaler -= .011;
  }
  
  void shrinkBox(){
    boxSize -= .5;
  }
  void growBox(){
    boxSize += .5;
  }
  
}
