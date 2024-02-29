hole_rad = 3.2/2;
spacer_rad = 6.2/2;
spacer_h = 9;


for(i= [1:6]) {
    translate([0, i*12, 0]) difference() {
        cylinder(h=spacer_h, r1=spacer_rad+2, r2 = spacer_rad, $fn=40);
        translate([0,0,-1]) cylinder(h=spacer_h+2, r=hole_rad, $fn=40);
    }
}