// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

y_belt_holder();
//rotate([0,90,0])beltholder_nuts();
//translate([7,6,-2])rotate([90,-90,0])y_beltclamp();


module y_belt_holder(){
translate([0, -10, 0])rotate([0,0,-90]){
	difference(){
    	union(){
    
    		translate([1.7, -8, 12.5]) cube_fillet([20, 5, 25],vertical = [2,2,0,2], center = true);

    		difference(){        	
            translate([-4.0, 5, 12.5]) cube_fillet([8.5, 26, 25], center = true, vertical = [1,1,0,0], fn=8);        
        		       
        
        		translate([0,7,0])intersection() {
            	for (i = [0 : 35/belt_tooth_distance])
            	{
                	translate([-9.0, 0, 1+i*belt_tooth_distance]) cube([3, 10, belt_tooth_distance*belt_tooth_ratio], center = true);
            	}
            	translate([0, 0, 35/2]) cube([20, 10, 35], center = true);
        		}

    		}
		}

		translate([5, -4, 5]) rotate([90, 0, 0]) screw();
		translate([5, -4, 20]) rotate([90, 0, 0]) screw();
		translate([-5,12,12])belt_clamp_nut();
		translate([5,-4.5,5])rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);
		translate([5,-4.5,20])rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

	}
	
}
}

module beltholder_nuts(){
	translate([-14, 0, 17.5])rotate([0,0,-90]) {
		difference(){
			cube_fillet([40, 4, 35], center = true,vertical = [0,0,2,2],top=[0,0,2,0],bottom=[0,0,2,0], fn=8);
			translate([-15, 10, -10]) rotate([90, 0, 0]) cylinder(r=m3_diameter/2,h=20);
			translate([-15, 0, -10]) rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

			translate([-15, 10, 10]) rotate([90, 0, 0]) cylinder(r=m3_diameter/2,h=20);
			translate([-15, 0, 10])rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

			translate([15, 10, -10]) rotate([90, 0, 0]) cylinder(r=m3_diameter/2,h=20);
			translate([15, 0, -10])rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

			translate([15, 10, 10]) rotate([90, 0, 0]) cylinder(r=m3_diameter/2,h=20);
			translate([15, 0, 10])rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

			translate([0, 5, 0])rotate([90,0,0])cylinder(r=10,h=10);
			
		}
		
	}

}

module y_beltclamp(){
    translate([2,0,0]) difference(){
        cube_fillet([24,17,7]);
        translate([24,m3_nut_diameter_bigger,0]/2){
            cylinder(r=3.4/2,h=30);
            translate([0,0,7]) mirror([0,0,1]) screw(slant=false,r=1.7,head_drop=3);

        }
    }
}
module belt_clamp_nut() {
    #translate([0,0,m3_nut_diameter/-2]) cube([2.5,m3_nut_diameter_bigger,m3_nut_diameter+0.3]);
    translate([0,m3_nut_diameter_bigger/2,0]){
        #translate([-2,0,0])rotate([0, 90,0]) cylinder(r=3.5/2,h=10,$fn=32);
        rotate([0,-90,0]) cylinder(r=3.5/2,h=20,$fn=32);
    }
}