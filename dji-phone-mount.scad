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





//
// Creates the main body of the mount
//
module mount_body() {
    cuboid([width, height, thickness], anchor=FRONT+LEFT+BOT, 
        rounding=corner_rounding, except=[TOP,BOTTOM]);
}
  

//
// Main function build the model in its entirety.
//
module build_model() {

    mount_body();
}

// Build the model
build_model();
