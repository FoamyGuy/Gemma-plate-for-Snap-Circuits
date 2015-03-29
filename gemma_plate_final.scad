

/********** MODULES **************/
module gemma(){
    color("Black")
    cylinder(r = 14, h = 7);
}

module gemma_hole(){
   translate([0,0,1]){
        difference(){
            cylinder(r = 16, h = 2);
            cylinder(r = 15, h = 2.01);
        }
    }
}

module board(){
       cylinder(r = 33.5, h = 1);
       
    
}

module snap(){
    color("Grey")
    cylinder(r=6, h=4.5);
}

module snaps(){
    translate([0, 0, 7])
    for(r=[0:(360/6):360]){
        rotate([0,0,r]){
            translate([27.5, 0, 0]){
                snap();
            }
        }
    }
}

module snap_hole(){
    difference(){
        cylinder(r=8, h=2);
        cylinder(r=7, h=3.1);
    }
}

module snap_holes(){
    translate([0, 0, 1])
    for(r=[0:(360/6):360]){
        rotate([0,0,r]){
            translate([25.5, 0, 0]){
                snap_hole();
            }
        }
    }
}

module wire_trace(){
    translate([12,0,3])
        cube([17.5, 3, 4], center=true);
}


module wire_traces(){
    for(r=[0:(360/6):360]){
        rotate([0,0,r]){
            wire_trace();
            
        }
    }
}

module usb_cutout(){
        translate([0,0,2])
            rotate([0,0,30])
                cube([32, 14, 2.01], center=true);
}


/********** RENDER **************/

//translate([0,0,2.5])
//gemma();
    difference(){
        union(){
            board();
            gemma_hole();
            snap_holes();
            
        }
    
        usb_cutout();
        wire_traces();
        
    }
    


//gemma();
//snaps();

//snaps();
