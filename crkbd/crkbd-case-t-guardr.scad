m5 = 8.79;
m4 = 7.66;

//ECHO: 4.395
//ECHO: 3.83
echo((4.7-0.3)*2)

//rotate([0,0,18])cylinder(h=15, r=2.65, $fn=10);
echo(m5/2);
echo(m4/2);
//translate([0, 0, 0]) cylinder(h=15, r=4.7, $fn=6);
difference() {
    translate([0, 0, 0]) cylinder(h=15, r=5.5, $fn=30);
    translate([0, 0, -1])  cylinder(h=15+2, d=4.65, $fn=20);
    translate([0, 0, -0.01]) cylinder(h=4, r=3.83+0.3, $fn=6);
}
//translate([0, -2.95, 3.5]) cube([5.8, 1.2, 0.4], center=true);
//translate([0, 2.95, 3.5]) cube([5.8, 1.2, 0.4], center=true);

translate([0, 0, 3.8]) cylinder(h=0.2, r=4.2+0.3, $fn=6);  //sacrificial support
//rotate([0, 0, 90]) translate([0, 2.95, 3.5+1*0.2]) cube([5.8, 1.2, 0.4], center=true);

difference() {
    translate([0, 0, 10]) cylinder(h=8, d=(4.7-0.3)*2, $fn=6);
    translate([0, 0, 9])  cylinder(h=10+2, d=4.65, $fn=20);
    
}