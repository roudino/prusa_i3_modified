
use <inc/library.scad>

//Round corner diameter
round_corner_diameter = 8;
coupling_height=27.5;

//Thin wall size
layer_height = 0.4;
perimeter_width_over_thicknes = 1.6;
infill_widht_over_thickness = 1.55;
thin_wall = 2*(perimeter_width_over_thicknes*layer_height+infill_widht_over_thickness*layer_height);
if(thin_wall<2){
	echo("Check thin wall size, its below 2mm!");
}
echo(thin_wall);

// MINI-HUXLEY VERSION (TODO, just place holder)
// include <configuration-huxley.scad>
m8_diameter=8.4;
m4_diameter=4.3;
m3_dia_clr=3.5;
m3_nut = 2.8;
m3_af = 5.8;
m6_diameter = 6;
m6_nut = 11.5;
bushing_diameter = 8;
motor_shaft=5.4;
bushing_rodsize = 6;
bushing_outerDiameter = 12;
bushing_lenght = 8;

coupling_dia=19;

module coupling()
{
	difference()
	{
		//body
		cylinder(h=coupling_height, r=coupling_dia/2, $fn=24);
		//m4 hole
		translate([0,0,-27.5*0.1]) polyhole(27.5*0.6, m8_diameter);
		//5mm hole for motor shaft
		translate([0,0,27.5*0.5]) polyhole(27.5*0.6, motor_shaft);
		//grub screw pocket
		translate([-(m3_nut+3),0,27.5-m3_af/2-1]) rotate([0,-90,0]) union()
			{
				translate([0,0,-coupling_dia/4]) polyhole(coupling_dia*0.6, m3_dia_clr);
				cylinder(h=m3_nut, r=m3_af/sqrt(3), center=true, $fn=6);
				translate([27.5/4,0,0]) cube([27.5*0.5,m3_af,m3_nut], center=true);
			}

		translate([-(m3_nut+3),0,4]) rotate([0,90,0]) union()
			{
				translate([0,0,-coupling_dia/4]) polyhole(coupling_dia*0.6, m3_dia_clr);
				cylinder(h=m3_nut, r=m3_af/sqrt(3), center=true, $fn=6);
				translate([coupling_height/4,0,0]) cube([27.5*0.5,m3_af,m3_nut], center=true);
			}
		translate([0,0,7.5]) rotate([0,0,90])
			linear_extrude(height = 10, convexity = 10, twist = 900)
			translate([0, 0, 0])
			square(size=10);//circle(r = 4);
	}
}

rotate([0,180,0])coupling();



