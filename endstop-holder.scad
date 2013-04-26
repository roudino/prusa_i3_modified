// PRUSA Mendel  
// Endstop holder
// Used to attach endstops to 8mm rods
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id endstop-holder
 * @name Endstop holder
 * @category Printed
 * @using 1 m3x20xhex
 * @using 1 m3nut
 * @using 2 m3washer
 */
//box_bottom();
endstop();
translate([-23,12,0])rotate([-0,0,0])box_top();
module microswitch(){
	difference(){
		cube([21,18,6.5]);
		translate([5.3,8,-1])cylinder(r=1.1,h=8,$fn=12);
		translate([15,8,-1])cylinder(r=1.1,h=8,$fn=12);
	}
}

module endstop(){
	outer_diameter = m8_diameter/2+3.3;
	opening_size = m8_diameter-1.5; //openingsize

	difference(){
		union(){
			translate([outer_diameter, outer_diameter, 0]) cylinder(h =10, r = outer_diameter, $fn = 20);
			translate([outer_diameter, 0, 0]) cube([15.5,outer_diameter*2,10]);
			translate([-1.5, 0, 0]) cube([14, 4, 10]);
			translate([17, 17.5, 5]) rotate([90, 0, 0]) #cylinder(h =5, r = 5.77, $fn = 6);
		}
		translate([9, outer_diameter-opening_size/2, 0]) cube([18,opening_size,20]);
		translate([outer_diameter, outer_diameter, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 18);

		//Securing hole
		translate([17, 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
		translate([17, 19.5, 5]) rotate([90, 0, 0]) #cylinder(h =5, r = m3_nut_diameter_horizontal/2, $fn = 6);

		translate([17, 17, 5]) rotate([90, 0, 0]) #cylinder(h =20, r = m3_diameter/2, $fn = 10);

		//microswitch();
	
	}
	translate([-23.7,0,0])rotate([90,0,0])mirror([0,0,1])box_bottom();
	
}

module box_bottom(){
	difference(){
		cube_fillet([24,18,9],vertical=[0,0,2,0],$fn=24);
		translate([1.5,1.5,2.6])color("red")microswitch();
		translate([5,-3,4])cube([14,5,5]);
		translate([5,5,5])cube([14,10,5]);
	}
	translate([6.4,0,3])cube([0.5,8.5,2.2]);
	translate([16.2,0,3])cube([0.5,8.5,2.2]);
}

module box_top(){
	difference(){
		cube_fillet([24,18,3],$fn=24);
		translate([1.5,1.5,1.01])color("red")microswitch();
		translate([-1,0,1])cube([5,18,5]);
		translate([20,0,1])cube([5,18,5]);
		translate([-0,-1,1])cube([24,5,5]);
	}
}

