
    difference() {
        union() {
            hull() {
                translate([0, 0, 0]) cylinder(h=2, r=3.8/2,  center=false, $fn=30); // pico washers
                translate([11.4, 0, 0]) cylinder(h=2, r=3.8/2,  center=false, $fn=30);
            }
            hull() {
                translate([0, 0+47, 0]) cylinder(h=2, r=3.8/2,  center=false, $fn=30);
                translate([11.4, 0+47, 0]) cylinder(h=2, r=3.8/2,  center=false, $fn=30);
            }
            
        }
        translate([0, 0, -1]) cylinder(h=30, r=2.2/2, center=false, $fn=30); // holes mount pico
        translate([11.4, 0, -1]) cylinder(h=30, r=2.2/2, center=false, $fn=30);
        translate([0, 0+47, -1]) cylinder(h=30, r=2.2/2, center=false, $fn=30);
        translate([11.4, 0+47, -1]) cylinder(h=30, r=2.2/2, center=false, $fn=30);
        translate([3.8/2, 0, -1])cube([11.4-3.8, 47, 4]);
        translate([3.8/2+0.02, -2.5, 1.4])cube([11.4-3.8-0.04, 47+6, 4]);
    }