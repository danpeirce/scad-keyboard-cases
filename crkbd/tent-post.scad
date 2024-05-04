
echo((4.7-0.3)*2);

post_h = 15;
hole = post_h-1; // relocate location of end of nut socket
washer_dia = 7+2*0.4;
post_dia = washer_dia+2*1.2;

translate([0,0,post_h]) rotate([180,0,0]) difference() {
    translate([0, 0, 0]) cylinder(h=post_h, d=post_dia, $fn=30);
    translate([0, 0, -1])  cylinder(h=post_h+2, d=4.65, $fn=20);
    translate([0, 0, -0.01]) cylinder(h=hole, d=washer_dia, $fn=30);  // nut socket
}

/*  
difference() {     // nut end
    translate([0, 0, 10]) cylinder(h=8, d=(4.7-0.3)*2, $fn=6);
    translate([0, 0, 9])  cylinder(h=10+2, d=4.65, $fn=20);
    
}
*/