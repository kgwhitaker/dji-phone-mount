//
// A phone mount that is used for the DJI controllers and has 
// a quadlock adapter bolted on.
//

include <BOSL2/std.scad>

// 3D Model Resolution.  
$fa = 1;
$fs = 0.4;

// *** Model Parameters ***


width = 110;
height = 70;
thickness = 5;
corner_rounding = 20;
screw_hole_diameter = 6;




//
// Creates the main body of the mount
//
module mount_body() {
    difference() {
        cuboid([width, height, thickness], anchor=FRONT+LEFT+BOT, 
            rounding=corner_rounding, except=[TOP,BOTTOM]);
        translate([width/2, height/2, thickness/2])
            cylinder(d=screw_hole_diameter, h=thickness + 1, center=true);
    }
}
  

//
// Main function build the model in its entirety.
//
module build_model() {

    mount_body();
}

// Build the model
build_model();
