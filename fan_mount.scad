include <configuration.scad>
thickness=5;
rotate([180,0,0])fan_mount();

//fan_support();

module fan_support(){
	difference(){
		cube([30,60,3],center=true);
		for(x=[-1,1]){
			translate([10,x*25,-3])cylinder(r=2,h=10);
		}
		translate([15,0,-3])cylinder(r=16,h=10);
		translate([-5,65.5,-3])cylinder(r=40,h=10);
	mirror([0,1,0])translate([-5,65.5,-3])cylinder(r=40,h=10);
	}
	
}

module fan_mount(){
	difference(){
		cube_fillet([52,52,thickness],center=true);
		translate([0,0,-thickness/2-0.1])cylinder(r=23,h=5.2);
		for(x=[-1,1]){
			for(y=[-1,1]){
				translate([x*20,y*20,-thickness/2-0.1])cylinder(r=3,h=5.2);
			}
		}
	}
	difference(){
		translate([0,0,-2])rotate([180,0,0])cylinder(r1=25,r2=10,h=16,$fn=64);
		translate([0,0,-1.9])rotate([180,0,0])cylinder(r1=23,r2=8,h=16.2,$fn=64);
	}
	translate([25.5,0,-12.5])rotate([0,90,0])fan_support();
}