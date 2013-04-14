include <inc/metric.scad>
include <inc/functions.scad>

hole_for_608=22.3;
608_width=7.4;

//spool_bottom();
rotate([-180,0,0])center_spool();
//rotate([-90,0,0])rod_spool();

module spool_bottom(){
	difference(){
		cube_fillet([30,45,5],top=[2,2,2,2],vertical=[2,2,2,2],center=true);
		translate([0,0,-3])nut(h=6,horizontal=true,d=m8_nut_diameter,center=true);
		translate([0,16,7])rotate([0,180,0])screw_cylinder();
		translate([0,-16,7])rotate([0,180,0])screw_cylinder();
	}
/**/
	difference(){
		translate([0,0,15])cylinder(r1=10,r2=6.1,h=25,center=true);
		translate([0,0,15])cylinder(r=threaded_rod_diameter/2,h=25.1,center=true);
	}

}


module rod_spool(){
/**/
	difference(){
		polyhole(20,15);
		translate([0,0,-0.5])polyhole(threaded_rod_diameter,31);
	}

	union(){
		translate([-7,6,0]){
			difference(){
				translate([7,23.5,7])rotate(a=[90,0,0])polyhole(threaded_rod_diameter+4,25);
				//cube([15,25,15]);
				translate([7,40.1,7])rotate(a=[90,0,0])polyhole(threaded_rod_diameter,50);
				
			}
		}

		
	}

}



module center_spool(){
/**/
	difference(){
		translate([0,0,7.5])cylinder(r1=16,r2=15,center=true,h=15,$fn=64);
		
		polyhole(threaded_rod_diameter,30.1);
		translate([0,0,-0.1])polyhole(hole_for_608,608_width);
		
	}

	

}

