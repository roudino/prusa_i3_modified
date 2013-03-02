include <configuration.scad>

%translate([80,0,50])rotate([0,-90,0])import("stl/x-carriage.stl",center=true);
rotate([-0,0,0])difference(){
	dremel_support();
	//#translate([8,-14,5])dial();

}

module dremel_support(){
	difference(){
		translate([-9,-40,-15])cube_fillet([45,30,50]);
		translate([13,-25,-17])cylinder(r=10,h=70);
		translate([-10,-25,-17])cube([60,2,60]);
		translate([-3,0,30])rotate([90,0,0])cylinder(r=m3_diameter/2,h=70,$fn=20);
		translate([27,0,30])rotate([90,0,0])cylinder(r=m3_diameter/2,h=70,$fn=20);
		translate([-3,0,-10])rotate([90,0,0])cylinder(r=m3_diameter/2,h=70,$fn=20);
		translate([27,0,-10])rotate([90,0,0])cylinder(r=m3_diameter/2,h=70,$fn=20);

	}
}

