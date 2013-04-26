include <configuration.scad>

x_wire_box();

module x_wire_box(){
	difference(){
		translate([2,0,0])cube_fillet([64,21,26],center=true);
		translate([4,0,0])cube_fillet([62,17,22],center=true);
		translate([22,0,4])cube_fillet([57,17,22],center=true);
		translate([-14,0,-22])cylinder(r=2,h=40);
		translate([30,6,-22])cylinder(r=2,h=30);
	}
}