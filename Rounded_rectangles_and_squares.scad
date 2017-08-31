$fn=100;

/*
One of the difficulties with OpenSCAD isputting rounded edges on shapes. One can use offsets, but it is somewhat difficult to getthe dimensions precise. This library is a rather crude attempt to make it a little easier to make rounded corners.

There are two modules here. 

The first is roundedRectangle. Size is  a 2 by 1 vector as usual. You can specify a single radius. By setting the corner variables (ne, nw, se, sw) equal to 1 or 0, you can turn  on or off the rounding for that corner. The center variable works as usual.

TODO:  radius could be turned into a 4 by 1 vector, so you could specify  different rounding radii at particular corners.

The second is roundedSquare, which is similar except that the rounding is controlled by a parameter ranging from 0 to 1.  1 is a complete circle in any quadrant that is rounded.

Example usage
Put this file in Documents/OpenSCAD/libraries and write at the top of the file:
use <Rounded_rectangles_and_squares.scad>

OR: Put this file in the same folder you are using and write at the top of the file:

use <./Rounded_rectangles_and_squares.scad>


roundedRectangle([20,30],radius=3,nw=0,sw=0,center=false);

roundedSquare(param=0.5, ne=0, side_length=20,center=false);

*/



// Example usages
//roundedSquare(param=0.5, ne=0,side_length=20,center=false);

//roundedRectangle([20,30],radius=3,sw=0,sw=0);

roundedRectangle([45,45], radius=3, sw=1,se=0,ne=0,nw=0, center=false);


module roundedRectangle(size, radius, ne=1,nw=1, se=1, sw=1,center=true)
{
//local variables
x = size[0];
y = size[1];

//If center is false, we need to translate
if (center)
{
hull()
{
    // place 4 circles in the corners, with the given radius
    if(sw==1) {translate([(-x/2)+(radius), (-y/2)+(radius), 0])
    circle(r=radius);}

    if(se==1) {translate([(x/2)-(radius), (-y/2)+(radius), 0])
    circle(r=radius);}

    if (nw==1) {translate([(-x/2)+(radius), (y/2)-(radius), 0])
    circle(r=radius);}

    if(ne==1) {translate([(x/2)-(radius), (y/2)-(radius), 0])
    circle(r=radius);}
    
     if(nw==0) {translate([-x/4,y/4, 0])
     square([x/2,y/2],center=true);}
     
     if(ne==0) {translate([x/4,y/4, 0])
     square([x/2,y/2],center=true);}
     
     if(se==0) {translate([x/4,-y/4, 0])
     square([x/2,y/2],center=true);}
     
     if(sw==0) {translate([-x/4,-y/4, 0])
     square([x/2,y/2],center=true);}   
}
}
else
{
translate([x/2,y/2,0])
hull()
{
    // place 4 circles in the corners, with the given radius
    if(sw==1) {translate([(-x/2)+(radius), (-y/2)+(radius), 0])
    circle(r=radius);}

    if(se==1) {translate([(x/2)-(radius), (-y/2)+(radius), 0])
    circle(r=radius);}

    if (nw==1) {translate([(-x/2)+(radius), (y/2)-(radius), 0])
    circle(r=radius);}

    if(ne==1) {translate([(x/2)-(radius), (y/2)-(radius), 0])
    circle(r=radius);}
    
     if(nw==0) {translate([-x/4,y/4, 0])
     square([x/2,y/2],center=true);}
     
     if(ne==0) {translate([x/4,y/4, 0])
     square([x/2,y/2],center=true);}
     
     if(se==0) {translate([x/4,-y/4, 0])
     square([x/2,y/2],center=true);}
     
     if(sw==0) {translate([-x/4,-y/4, 0])
     square([x/2,y/2],center=true);}   
}
}
}






//Note parameter runs from 0 < param <= 1.
// 1 is completely rounded.

module roundedSquare(param = 0.5,ne=1,nw=1, se=1, sw=1,side_length=24,center=true){

//Define the center of the circles
center_position=side_length*(1-param)/2;
    
//If center is false, then we need to translate
if (center){
hull(){
    if(nw==1) {translate([-center_position,center_position,0]) circle(side_length/2 - center_position);}
    if(sw==1) { translate([-center_position,-center_position,0]) circle(side_length/2 - center_position);}
    if(ne==1) { translate([center_position,center_position,0]) circle(side_length/2 - center_position);}
    if(se==1) { translate([center_position,-center_position,0]) circle(side_length/2 - center_position);}
    
    if(nw==0) {translate([-side_length/4,side_length/4,0]) square(size=side_length/2,center=true);}
    if(ne==0) {translate([side_length/4,side_length/4,0]) square(size=side_length/2,center=true);}
    if(sw==0) {translate([-side_length/4,-side_length/4,0]) square(size=side_length/2,center=true);}
    if(se==0) {translate([side_length/4,-side_length/4,0]) square(size=side_length/2,center=true);}
}
}
else
{
translate([side_length/2,side_length/2,0])
hull(){
    if(nw==1) {translate([-center_position,center_position,0]) circle(side_length/2 - center_position);}
    if(sw==1) { translate([-center_position,-center_position,0]) circle(side_length/2 - center_position);}
    if(ne==1) { translate([center_position,center_position,0]) circle(side_length/2 - center_position);}
    if(se==1) { translate([center_position,-center_position,0]) circle(side_length/2 - center_position);}
    
    if(nw==0) {translate([-side_length/4,side_length/4,0]) square(size=side_length/2,center=true);}
    if(ne==0) {translate([side_length/4,side_length/4,0]) square(size=side_length/2,center=true);}
    if(sw==0) {translate([-side_length/4,-side_length/4,0]) square(size=side_length/2,center=true);}
    if(se==0) {translate([side_length/4,-side_length/4,0]) square(size=side_length/2,center=true);}
}




}
}







