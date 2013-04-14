include <configuration.scad>

rotate([180,0,0])alu_profile_caps();

module alu_profile_caps(){
	cube_fillet([30,30,3], center = true, top=[3,3,3,3],$fn=36);
	difference(){
		translate([11,11,-5])cube_fillet([6,6,10],vertical=[2,2,2,2],center=true,$fn=36);
		translate([11,11,-5])cube_fillet([4,4,10.1],vertical=[2,2,2,2],center=true,$fn=36);
	}

	difference(){
		translate([-11,11,-5])cube_fillet([6,6,10],vertical=[2,2,2,2],center=true,$fn=36);
		translate([-11,11,-5])cube_fillet([4,4,10.1],vertical=[2,2,2,2],center=true,$fn=36);
	}

	difference(){
		translate([11,-11,-5])cube_fillet([6,6,10],vertical=[2,2,2,2],center=true,$fn=36);
		translate([11,-11,-5])cube_fillet([4,4,10.1],vertical=[2,2,2,2],center=true,$fn=36);
	}

	difference(){
		translate([-11,-11,-5])cube_fillet([6,6,10],vertical=[2,2,2,2],center=true,$fn=36);
		translate([-11,-11,-5])cube_fillet([4,4,10.1],vertical=[2,2,2,2],center=true,$fn=36);
	}
	
}