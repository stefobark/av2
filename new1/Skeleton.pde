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
        if (pts[i].dist( pts[j] ) < 55) {
          skeleton.addEdge(pts[i], pts[j]);
        }
      }
    }
  }
  
  void changePoints(float one, float two){
    for (int i=0; i<pts.length; i++) {
      pts[i].x = pts[i].x + one + random(-5,5);
      pts[i].y = pts[i].y + two + random(-5,5);
    }
   }
  
  void display(float one, float two){
    stroke(0,0,0,1);
    fill(255,255,255,4);
    skeleton.plot(one , two);  // Thickness as parameter
  }
}
