include <configuration.scad>

wire_holder();

module wire_holder(){
	translate([-5,-6,0])cube_fillet([10,12,2],top=[2,2,2,2],$fn=36);
	translate([0,4.1,-3])color("red")cube([8,2,1.2],center=true);
	translate([0,-4.1,-3])color("red")cube([8,2,1.2],center=true);
	translate([0,-3.6,-1.25])cube([8,1,2.5],center=true);
	translate([0,3.6,-1.25])cube([8,1,2.5],center=true);
}