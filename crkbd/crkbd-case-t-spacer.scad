include <crkbd-case-enclosure-mod.scad>

module tab_spacer() {           
    intersection() {
        translate([14.5, 0, 0.3]) rotate([0, 0, 180]) translate([24.4, 73.5, 0]) enclosure();
        translate([0, 0, 4]) cube([14.5, 13, 3]);
    }
}
tab_spacer();
//translate([18, 0, 0]) tab_spacer();