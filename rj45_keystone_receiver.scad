$fa = 5;
$fs = 0.01;

/*
 * The RJ45 keystone receiver
 */
// adjustments to original
clip_adjustment =0.9;   // some keystone jacks fit too tight so we add a little here
exterior_slot_adjustment = 3.4; // original 2.6

// the following have not been changed
outside_width=18;
outside_height=25 + clip_adjustment;
outside_depth=9.9;
outside_wall = 1.55;
inside_width = outside_width-(outside_wall*2);
inside_height= outside_height-5.56; //19.44;
inside_cutout_height = outside_height - 2.86;
inside_cutout_depth = outside_depth - 3.1;
exterior_slot = 7.9;
exterior_notch_height = 17.0;
exterior_notch_depth = outside_depth - 2.7;
exterior_slot_height = outside_height - 8.75;
top_clip_bar = outside_height - 2.96 ;

module rj45Receiver() 
{
    difference() {
        cube([outside_width, outside_height, outside_depth]);
        translate([outside_wall, 2.6, 0]) {
            cube([inside_width, inside_height, exterior_slot]);
        }
        // exterior slot
        translate([outside_wall, exterior_slot_adjustment+clip_adjustment,
                exterior_slot]) {
            cube([inside_width, exterior_notch_height, 2]);
        }
        // exterior_notch
        translate([outside_wall, exterior_notch_height+clip_adjustment,
                exterior_notch_depth]) {
            rotate(v=[1, 0, 0], a=-27.3) 
                cube([inside_width, 3.5, 3]);
        }
        // interior cutout
        translate([outside_wall, 1.43, 1.35]) {
            cube([inside_width, inside_cutout_height, inside_cutout_depth]);
        }
    }
    // top clip bar
    translate([0, top_clip_bar, -1.35]) {
        intersection() {
            cube([outside_width, 2.96, 1.35]);
            union() {
                translate([0, 1.61, 0]) {
                    cube([20.42, 1.61, 1.35]);
                }
                translate([0, 1.35, 1.35]) {
                    rotate(v=[0, 1, 0], a=90) {
                        cylinder(h=20.42, r=1.35);
                    }
                }
            }
        }
    }
    // bottom clip bar
    translate([0, 0, -1.35]) {
        intersection() {
            cube([outside_width, outside_wall*2, 1.35]);
            union() {
                cube([20.42, 1.25, 1.35]);
                translate([0, 1.25, 1.35]) {
                    rotate(v=[0, 1, 0], a=90) {
                        cylinder(h=20.42, r=1.35);
                    }
                }
            }
        }
    }
}

// these are sometimes needed when fitting the jacks into projects
function rj45_width() = outside_width;
function rj45_height() = outside_height;
function rj45_depth() = outside_depth;

 // So a hole can be cut for the keystone socket
module rj45VolumeBlock() {
    cube([outside_width, outside_height, outside_depth]);
}

rotate([0,180,0]) 
    rj45Receiver();
