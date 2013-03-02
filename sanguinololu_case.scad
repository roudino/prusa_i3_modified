include <configuration.scad>


//sanguinololu();

//mirror()sanguinololu_bottom();
translate([0,60,-4])rotate([0,180,0])sanguinololu_top();

module sanguinololu_top(width=80,length=40){
	difference(){
		translate([0,0,5])cube_fillet([106, 56, 22],vertical = [2,2,2,2],top = [2,2,2,2], center = true);
		#translate([0,0,-2])sanguinololu();
		translate([43,-20,15])rotate([0,0,90])holes(diameter=2,rows=9,cols=13);		
		translate([0,26.1,1.1])cube([80, 4, 16],center = true);
	}
}

module sanguinololu_bottom(){
	difference(){
		translate([0,0,-13.1])cube_fillet([106, 56, 14],vertical = [0,0,2,2],bottom = [2,2,2,2], center = true);
		#translate([0,0,-2])sanguinololu();
/**/		translate([47,22,-21])nut(d=m4_nut_diameter_horizontal,h=2.5);
		translate([47,-22,-21])nut(d=m4_nut_diameter_horizontal,h=2.5);
		translate([-47,22,-21])nut(d=m4_nut_diameter_horizontal,h=2.5);
		translate([-47,-22,-21])nut(d=m4_nut_diameter_horizontal,h=2.5);

		translate([0,26,-10.1])cube([80, 4, 12],center = true);
		translate([-52,-12,-10.1])cube([4, 20, 12],center = true);
	};
	rotate([0,0,-180])translate([-65,-28,-18])support();
	mirror()rotate([0,0,-180])translate([-65,-28,-18])support();
}

module sanguinololu(){
	difference(){
		cube([102,52,32], center=true);
		translate([47,22,-20])cylinder(r=3,h=5);
		translate([-47,-22,-20])cylinder(r=3,h=5);
		translate([-47,22,-20])cylinder(r=3,h=5);
		translate([47,-22,-20])cylinder(r=3,h=5);

		translate([47,22,-5])cylinder(r=3,h=36);
		translate([-47,-22,-5])cylinder(r=3,h=36);
		translate([-47,22,-5])cylinder(r=3,h=36);
		translate([47,-22,-5])cylinder(r=3,h=36);

	}
	translate([-33,-26.8,-6])cube([13,3.5,13],center=true);
	translate([-47,-22,-20])cylinder(r=2,h=45);
	translate([-47,22,-20])cylinder(r=2,h=45);
	translate([47,-22,-20])cylinder(r=2,h=45);
	translate([47,22,-20])cylinder(r=2,h=45);

}

module support(){
	height=12;
	difference(){
		cube([14,2,height]);
		translate([-0.1,4,-0.1])rotate([90,0,0])roundcorner(3);
		translate([-0.1,-4,height+0.1])rotate([-90,0,0])roundcorner(3);
		translate([6,7.5,6])rotate([90,0,0])screw_cylinder();
	}

}




// calculate the series of holes needed to make the mold
module holes( multiplier = 1,cols=6,rows=5,diameter=2,height=3 )
{
	
	for ( i = [1 : rows] )
	{
		for ( j = [1 : cols] )
		{
			if(i % 2 == 1)
			{
				translate([(2 * diameter + 1) * i -  i   , ((2 * diameter + 2) * j) + diameter, 0])
				cylinder(r =diameter, h = height * multiplier, $fa=6, center = true);
			}else
			{
				translate([(2 * diameter + 1) * i - i  , (2 * diameter + 2) * j , 0])
				cylinder(r =diameter, h = height * multiplier, $fa=6, center = true);
			}
		}
	}
}