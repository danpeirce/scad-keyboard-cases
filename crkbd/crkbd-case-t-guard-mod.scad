
echo((4.7-0.3)*2);

mod = 3; // relocate location of end of nut socket


difference() {
    translate([0, 0, 0]) cylinder(h=15, r=5.5, $fn=30);
    translate([0, 0, -1])  cylinder(h=15+2, d=4.65, $fn=20);
    translate([0, 0, -0.01]) cylinder(h=4+mod, r=3.83+0.3, $fn=6);  // nut socket
}

translate([0, 0, 3.8+mod]) cylinder(h=0.2, r=4.2+0.3, $fn=6);  //sacrificial support
//rotate([0, 0, 90]) translate([0, 2.95, 3.5+1*0.2]) cube([5.8, 1.2, 0.4], center=true);

difference() {     // nut end
    translate([0, 0, 10]) cylinder(h=8, d=(4.7-0.3)*2, $fn=6);
    translate([0, 0, 9])  cylinder(h=10+2, d=4.65, $fn=20);
    
}