$fn=100;


//Usage: 
// use <../Library/sector.scad>
// sector(r=radius, angle);
// Note: angle should be between 0 and 360 inclusive.

module sector(r, angle){
    if(angle <= 90){
        difference(){
        circle(r=r);
        rotate([0,0,angle])
        square([r,r], center=false);
        rotate([0,0,90])
        square([r,r], center=false);    
        rotate([0,0,180])
        square([r,r], center=false);
        rotate([0,0,270])
        square([r,r], center=false);
        }
      }  
      else if(angle <= 180){
        difference(){
        circle(r = r);
        rotate([0,0,angle])
        square([r,r], center=false);    
        rotate([0,0,180])
        square([r,r], center=false);
        rotate([0,0,270])
        square([r,r], center=false);
        }
     }
     else if(angle <= 270){
         difference(){
        circle(r = r);
        rotate([0,0,angle])
        square([r,r], center=false);
        rotate([0,0,270])
        square([r,r], center=false);
        }
    }
     else if(angle < 360){
         difference(){
        circle(r = r);
        rotate([0,0,angle-360])
        square([r,r],center=false);   
        }
        intersection(){
        circle(r=r);
        square([r,r],center=false);
        }
    }
 }
     
       
//sector(3,45);