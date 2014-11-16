$fa = 5;
$fs = 0.01;

/*
 * The RJ45 keystone receiver
 */
module rj45Receiver() {
	difference() {
		cube([18, 25, 9.9]);
		translate([1.55, 2.6, 0]) {
			cube([14.9, 19.44, 7.9]);
		}
		translate([1.55, 2.6, 7.9]) {
			cube([14.9, 16.25, 2]);
		}
		translate([1.55, 17.45, 7.2]) {
			rotate(v=[1, 0, 0], a=-27.3) {
				cube([14.9, 3.5, 3]);
			}
		}
		translate([1.55, 1.43, 1.35]) {
			cube([14.9, 22.14, 6.8]);
		}
	}
	translate([0, 22.04, -1.35]) {
		intersection() {
			cube([18, 2.96, 1.35]);
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

	translate([0, 0, -1.35]) {
		intersection() {
			cube([18, 2.6, 1.35]);
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

/*
 * So a hole can be cut for the keystone socket
 */
module rj45VolumeBlock() {
	cube([18, 25, 9.9]);
}

rj45Receiver();
