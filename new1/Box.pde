import dawesometoolkit.*;
DawesomeToolkit dawesome = new DawesomeToolkit(this);
  
class Box {
  float boxSize = 10;
  ArrayList<PVector> vectors;
  boolean onOff = false;
  Box(){
    vectors = dawesome.fibonacciSphereLayout(100,100);
  }
  
  void onOff(){
    if(onOff == true){
      onOff = false;
    } else {
      onOff = true;
    }
  }
  
  void display(){
    if(onOff == true){
      stroke(0,0,0,10);
      fill(255,255,255,10);
      for (PVector p : vectors) {
        pushMatrix();
        float scaler = sin(frameCount/100.0)*1.5;
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
}