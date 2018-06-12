$fn=100;

//Create a prism based on a right angled triangle rotated to form a wedge.

//There is a raised_edge version which puts a small base underneath

//x - x-dimension length
//y - y-dimension length
//h - height of wedge
//b - height of rectangular base in raised version
//center=true or false (false is default)

//based on https://github.com/dannystaple/OpenSCAD-Parts-Library/blob/master/prism.scad

module wedge(x, y, h, center=false) {
    
    if (center) {
      polyhedron(points=[
               [0,-y/2,h],           // 0    front top corner
               [0,-y/2,0],[x,-y/2,0],   // 1, 2 front left & right bottom corners
               [0,y/2,h],           // 3    back top corner
               [0,y/2,0],[x,y/2,0]    // 4, 5 back left & right bottom corners
       ], faces=[ // points for all faces must be ordered clockwise when looking in
               [0,2,1],    // top face
               [3,4,5],    // base face
               [0,1,4,3],  // h face
               [1,2,5,4],  // w face
               [0,3,5,2],  // hypotenuse face
       ]);
    }
    else
    {
          polyhedron(points=[
               [0,0,h],           // 0    front top corner
               [0,0,0],[x,0,0],   // 1, 2 front left & right bottom corners
               [0,y,h],           // 3    back top corner
               [0,y,0],[x,y,0]    // 4, 5 back left & right bottom corners
       ], faces=[ // points for all faces must be ordered clockwise when looking in
               [0,2,1],    // top face
               [3,4,5],    // base face
               [0,1,4,3],  // h face
               [1,2,5,4],  // w face
               [0,3,5,2],  // hypotenuse face
       ]);
        
       
    }
}



module raised_wedge(x,y,h,b,center=false){
    if (center) {
    translate([0,-y/2,0])
    cube([x,y,b]);
    }
    else {
    cube([x,y,b]);
    }
    translate([0,0,b])
    wedge(x,y,h,center=center);
}

// Example usage

//wedge(5,3,2);

//wedge(5, 3, 2,center=true);

//raised_wedge(5,3,2,1,center=false);