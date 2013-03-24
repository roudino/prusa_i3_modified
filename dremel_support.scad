include <configuration.scad>

//%translate([80,0,50])rotate([0,-90,0])import("stl/x-carriage.stl",center=true);
rotate([90,0,0])difference(){
	dremel_support();
	//#translate([8,-14,5])dial();

}

module dremel_support(){
	width=1;
	difference(){
		union(){
			translate([-9,-40,5])cube([45,width,30]);
			translate([-9,-40,15])cube([45,45,width]);
			
			translate([-9,5,15.1])rotate([-180,0,0])triangle_support(w=width);
			translate([36-width,5,15.1])rotate([-180,0,0])triangle_support(w=width);
			translate([-9+width,5,15-0.1+width])rotate([-180,180,0])triangle_support(w=width);
			translate([36,5,15-0.1+width])rotate([-180,180,0])triangle_support(w=width);

		}
		translate([14,-14,10])cylinder(h=10,r=9.5);
		
		translate([-3,0,30])rotate([90,0,0])cylinder(r=m3_diameter/2,h=70,$fn=20);
		translate([27,0,30])rotate([90,0,0])cylinder(r=m3_diameter/2,h=70,$fn=20);
		

	}
}

module triangle_support(w=3,h=10){
	difference(){
		cube([w,42,h]);
		translate([-1,0,0])rotate([13,0,0])cube([w+2,60,h]);

	}
}


