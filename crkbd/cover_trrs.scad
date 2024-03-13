offsetx = 3.5;
offsety = 3.5;


difference() {
    union() {
    translate([0,0,4]) cube([19, 27, 3]);
    translate([0.01,0.01,0]) cube([19-0.02, 7, 4.1]);
    }
    translate([offsetx+11.4, offsety, -0.1]) cylinder(h=20, r=2.2/2+0.3, center=false, $fn=30);  // holes mount TRRS connector
    translate([offsetx, offsety, -0.1]) cylinder(h=20, r=2.2/2+0.3, center=false, $fn=30);
    translate([offsetx+11.4, offsety+20, -0.1]) cylinder(h=20, r=2.2/2+0.3, center=false, $fn=30);
    translate([offsetx, offsety+20, -0.1]) cylinder(h=20, r=2.2/2+0.3, center=false, $fn=30);
}
