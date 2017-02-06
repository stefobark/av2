class CamController {
  //zoom value
  float zm = 45;
  //camera spin value
  float sp;
  float spinScale = 0.0001;

  CamController(){}
  
  void doCam(int frames){
    sp = spinScale * frames;
    camera(zm * cos(sp), zm * sin(sp), zm * sin(sp), 0, 0, 0, 0, 0, -1);
  }

 void zoomOut(){
   zm += 10;
 }
 
 void zoomIn(){
   zm -= 10;
 }
 
 void moreSpin(){
   spinScale += .001;
 }
 
 void lessSpin(){
   spinScale -= .001;
 }
 

}
