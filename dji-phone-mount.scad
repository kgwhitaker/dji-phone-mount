//
// A phone mount that is used for the DJI controllers and has 
// a quadlock adapter bolted on.
//

include <BOSL2/std.scad>

// 3D Model Resolution.  
$fa = 1;
$fs = 0.4;

// *** Model Parameters ***

// Overall width and height of the mount
width = 120;
height = 70;


// Thickness for the slots that insert into the rubber clamp of the controller.
slot_thickness = 3;

//

corner_rounding = 8;
screw_hole_diameter = 6;
nut_sink_diameter = 12;

//
// Creates the main body of the mount
//
module mount_body() {
    union() {
        cuboid([width, height, slot_thickness], anchor=FRONT+LEFT+BOT, 
            rounding=corner_rounding, except=[TOP,BOTTOM]);  


        translate([0, (height * 0.2) / 2, slot_thickness])
            wedge([width, height * 0.8, slot_thickness * 3], anchor=FRONT+LEFT+BOT);  

    }
}

// 
// Screw holes for the quadlock adapter  
//
module screw_hole() {
    screw_spacing = 25;
    y_pos = height / 3;

    // Angle of the wedge so that screw holes are perpendicular to the wedge slope.
    wedge_angle = 90 - atan((height * 0.8) / (slot_thickness * 3));

    translate([((width/2) - (screw_spacing / 2)), y_pos, slot_thickness / 2 +1])
        rotate([-wedge_angle, 0, 0])
            cylinder(d=screw_hole_diameter, h=(slot_thickness * 5), center=true);

    translate([((width/2) - (screw_spacing / 2)), y_pos, 0])
        rotate([-wedge_angle, 0, 0])
            cylinder(d=nut_sink_diameter, h=slot_thickness, center=true);

    translate([((width/2) + (screw_spacing / 2)), y_pos, slot_thickness / 2 + 1])
        rotate([-wedge_angle, 0, 0])
            cylinder(d=screw_hole_diameter, h=(slot_thickness * 5), center=true);

    translate([((width/2) + (screw_spacing / 2)), y_pos, 0])
        rotate([-wedge_angle, 0, 0])
            cylinder(d=nut_sink_diameter, h=slot_thickness, center=true);

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
