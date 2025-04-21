//
// A phone mount that is used for the DJI controllers and has 
// a quadlock adapter bolted on.
//

include <BOSL2/std.scad>

// 3D Model Resolution.  
$fa = 1;
$fs = 0.4;

// *** Model Parameters ***


width = 120;
height = 70;
thickness = 5;
corner_rounding = 10;
screw_hole_diameter = 6;




//
// Creates the main body of the mount
//
module mount_body() {
    cuboid([width, height, thickness], anchor=FRONT+LEFT+BOT, 
        rounding=corner_rounding, except=[TOP,BOTTOM]);  
}

// 
// Screw holes for the quadlock adapter  
//
module screw_hole() {
    screw_spacing = 25;
    translate([((width/2) - (screw_spacing / 2)), height/2, thickness/2])
        cylinder(d=screw_hole_diameter, h=thickness + 1, center=true);

    translate([((width/2) + (screw_spacing / 2)), height/2, thickness/2])
        cylinder(d=screw_hole_diameter, h=thickness + 1, center=true);

}

//
// Main function build the model in its entirety.
//
module build_model() {

    difference() {
        mount_body();

        screw_hole();
        
    }
}

// Build the model
build_model();
