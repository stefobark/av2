import ComputationalGeometry.*;
IsoSkeleton skeleton = new IsoSkeleton(this);

class Skeleton {
  PVector[] pts;
  Skeleton(int points,float rSize){
    // Create points to make the skeletor
    pts = new PVector[points];
    for (int i=0; i<pts.length; i++) {
      pts[i] = new PVector(random(-rSize, rSize), random(-rSize, rSize), random(-rSize, rSize) );
    }
    build();
  }

//add points to skeleton
void build(){
  //check distance to see if we should draw an edge
  for (int i=0; i<pts.length; i++) {
      for (int j=i+1; j<pts.length; j++) {
        if (pts[i].dist( pts[j] ) < 10) {
          skeleton.addEdge(pts[i], pts[j]);
        }
      }
    }
  }
  
  void changePoints(){
    for (int i=0; i<pts.length; i++) {
      pts[i].x += + random(-.025,.025);
      pts[i].y += random(-.025,.025);
    }
   }
  
  void display(float one, float two){
    stroke(0,0,0,10);
    fill(255,255,255,25);
    skeleton.plot(one,two);  // Thickness as parameter
  }
}
