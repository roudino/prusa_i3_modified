include <configuration.scad>

rotate([0,180,0])y_foot();

module y_foot(){
	difference(){
		union(){
			cylinder(r=15.6/2,h=15,$fn=6);
			sphere(r=6,$fn=48);
		}
		translate([0,0,-3])cylinder(r=4,h=20);
	}
}

