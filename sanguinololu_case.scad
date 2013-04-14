include <configuration.scad>



wall_width=2;
bottom_width=140;
bottom_depth=80;
bottom_height=30;

top_width=140;
top_depth=110;
top_height=10;

//sanguinololu();
//sanguinololu_bottom();
translate([0,0,30])rotate([-180,0,0])sanguinololu_top();
//fan();
module fan(){
	for(x=[-1,1]){
		for(y=[-1,1]){
			difference(){
				translate([x*30,y*30,0])cylinder(r=8.2,h=8,$fn=6);
				translate([x*30,y*30,-1])cylinder(r=4,h=12,$fn=6);
			}
		}
	}
}
module sanguinololu_top(){
	translate([55,40,2])fan();
	//case
	difference(){
		translate([0,-30,0])cube_fillet([top_width,top_depth,top_height],bottom=[1,1,1,1],vertical=[2,2,2,2]);
		translate([wall_width,wall_width-30,-2*wall_width])cube_fillet([top_width-2*wall_width,bottom_depth-2*wall_width,top_height+wall_width],bottom=[2,2,2,2],vertical=[2,2,2,2]);
		translate([-3,-31,-2])cube_fillet([32,32,50]);
		translate([wall_width,46,-wall_width])color("red")cube_fillet([136,32,top_height]);
	
		translate([25,3,10])holes(diameter=6,height=10,cols=4,rows=4);
		//holes
		for(x=[8,bottom_width-8]){
			for(y=[8,bottom_depth-8]){
				translate([x,y,-0.1]){
					cylinder(r=m4_nut_diameter_horizontal/2,h=1.2,$fn=6);
					cylinder(r=2,h=20,$fn=12);
				}
			}
		}

	}
}

module sanguinololu_bottom(){
	//sanguinololu plate
	translate([60,50,1])sanguinololu();

	mirror()translate([-1,-13,bottom_height/2])rotate([0,0,-90])support(height=30,width=32);
	translate([bottom_width+14,1,bottom_height/2])support(height=30,width=32);

	translate([1,1,1.1])cube([bottom_width-2,bottom_depth-2,0.25]);

	//wire holder
	translate([115,20,0])wire_holder();

	//case
	difference(){
		cube_fillet([bottom_width,bottom_depth,bottom_height],bottom=[1,1,1,1],vertical=[2,2,2,2]);
		translate([wall_width,wall_width,wall_width])cube_fillet([bottom_width-2*wall_width,bottom_depth-2*wall_width,bottom_height+wall_width],bottom=[2,2,2,2],vertical=[2,2,2,2]);

		//back window
		translate([6,-2,2])cube([bottom_width-12,6,30]);

		//usb hole
		translate([79,70,4.1])color("red")cube([13,16,11]);

		//wire hole
		translate([135,70,12])rotate([0,90,0])color("red")cylinder(r=4,h=10);
		
		//holes
		for(x=[8,bottom_width-8]){
			for(y=[8,bottom_depth-8]){
				translate([x,y,-0.1]){
					cylinder(r=m4_nut_diameter_horizontal/2,h=1.2,$fn=6);
					cylinder(r=2,h=10,$fn=12);
				}
			}
		}

	}
	
}

module wire_holder(holders=3,separator=8){
	translate([0,-3,0])cube([16,separator*holders,1]);
	for(i=[0:holders-1]){
		translate([0,i*separator,0])difference(){
			cube([16,2,12]);
			translate([6,-0.1,1])cube([4,2.2,13]);
		}
	}
}

module support(height=14,depth=2,width=16){
	
	difference(){
		cube_fillet([width,depth,height],center=true,vertical=[0,0,0,0],bottom=[0,0,0,4],top=[0,0,0,4]);
		
		translate([0,7,0])rotate([90,0,0])screw_cylinder(center=true);
	}

}


module sanguinololu(){
	cube([100,50,1],center=true);
	translate([47.5,22.4,0])cylinder(r=1.8,h=5,$fn=12);
	translate([-46,22.4,0])cylinder(r=1.8,h=5,$fn=12);
	translate([-46,-21,0])cylinder(r=1.8,h=5,$fn=12);
	translate([47.5,-21,0])cylinder(r=1.8,h=5,$fn=12);
	//translate([24,24,0])cube([13,18,11]);
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