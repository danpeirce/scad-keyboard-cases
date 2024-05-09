module theCover() {
    projection() import("stls/crkbd-case-cover.stl", convexity=10);
}


module theBase() {
    difference() {
        rotate([30,0,0]) translate([60, 79, 0]) difference() {
            linear_extrude(10, convexity=10) offset(2) theCover();
            translate([0,0,0.8]) linear_extrude(10, convexity=10) offset(-2.3) offset(2) theCover();
            translate([-75, -120, -1]) cube([150, 100, 20]);
            translate([-75, 33, -1]) cube([150, 100, 20]);
        }
        translate([0, -50, -1]) cube([150, 100, 200]);
    }
    
    
    hull() {
        rotate([30,0,0]) translate([60, 79, 0]) difference() {
            linear_extrude(1.4, convexity=10) offset(2) theCover();
            translate([-75, -120, -1]) cube([150, 100, 20]);
            translate([-75, 33, -1]) cube([150, 100, 20]);
        }
        translate([60, 70, 0]) difference() {
            linear_extrude(1.4, convexity=10) offset(2.2) theCover();
            translate([-75, -120, -1]) cube([150, 100, 20]);
            translate([-75, 33, -1]) cube([150, 100, 20]);        
        }
    }
}


rotate([30,0,0]) translate([60, 79, 0]) difference() {
    translate([-60, -79, 0]) rotate([-30,0,0]) hull() theBase();
    translate([0,0,0.8]) linear_extrude(10, convexity=10) offset(-2.3) offset(2) theCover();
}

