include <pico.scad>


plate_to_support = 8.4 + 9;
pico_length = 51;
pico_width = 21;
mhole_spacew = 11.4;
mhole_spacel = pico_length - 2*2.0;
holedia = 2.1;
sup_dia = 3.8;
fuz =0.01;

if($preview) translate([0,0,-1.5]) pico();

difference() {
    union() {
        translate([0,0,plate_to_support-1]) linear_extrude(1) offset(3, $fn=15) 
            square([pico_length-3*2,pico_width-3*2], center=true);
        for(i = [-1:2:1]) {
            for ( j=[-1:2:1]) {
                union() {
                translate([mhole_spacel/2*i, mhole_spacew/2*j, -2]) 
                    cylinder(h=10, r=holedia/2-0.25, $fn=20, center=false);
                translate([mhole_spacel/2*i, mhole_spacew/2*j, 0]) 
                    cylinder(h=plate_to_support-fuz, r=sup_dia/2, $fn=20, center=false);
                }
            }
        }
    }
    translate([0,0,plate_to_support-1.5]) linear_extrude(3) offset(3, $fn=15) 
            square([pico_length-3*2-8,pico_width-3*2-8], center=true);
}
