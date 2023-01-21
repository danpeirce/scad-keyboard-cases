// Cases for humla keyboard.
//
// Two main versions:
//
// - A simple bumper case.
//
// - A case that includes an adaptor that lets the humla sit nicely over the
//   top of the existing keyboard of my hp zenbook laptop.

include <kle/hp-zenbook.scad>
include <../keyboard-case.scad>

$fa = 0.5;
$fs = $preview ? 5 : 1;

eps = 0.01;

// Parameters for the hp zenbook keyboard for the adaptor
hp_key_depth = 1.3;
hp_channel_width = 2.5;
unit = 18.68;  // hp key spacing

outer_thickness = 2;   // Thickness of the outer wall of the bumper
base_thickness = 1.0;  // Thickness of the base
humla_thickness = 3.0; // Depth to ensure flush with top of humla pcb (i.e. thickness of pcb plus any rear protruberances)
pcb_tol = 0.35;        // Tolerance between pcb and bumper side wall
case_thickness = base_thickness + humla_thickness;


// 2d profile of the humla PCB. SVG extracted from kicad and painfully manipulated into something OpenSCAD could load
// This is also translated to overlap nicely with where the hp-zenbook keyboard will be
module humla_pcb() {
    translate(v = [31, -107.5, 0]) resize([210, 0, 0],  auto = true) import(file = "orig/humla-base-plate-outline.svg");
}

module case_key_hole(size) {
    offset(delta = -hp_channel_width / 2, chamfer = false) square(size * unit, center = true);
}

module key_holes(keys, type = "both") {
    // Mirror because KLE has Y axis reversed
    mirror([0, 1, 0]) for (key = keys) {
        position_key(key, unit = unit)
            case_key_hole(key_size(key));
    }
}

// Rebate for access to MCU on/off switch
module mcu_switch_cutout() {
    translate(v = [111.5, -34.3, -eps])  rotate([0, 0, -13]) translate(v = [-outer_thickness/2 - pcb_tol, 0, 4]) cube([outer_thickness, 12, 10], center = true);
}

// A plate containing cutouts corresponding to the hp-zenbook key positions. This will position the humla
// and stop it sliding around
module laptop_keyboard_adaptor_plate() {
    difference() {
        union() {
            // Laptop key cutouts
            linear_extrude(height = hp_key_depth, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) difference() {
                offset(r = outer_thickness, chamfer = false) humla_pcb();
                key_holes(hp_zenbook, type = "plate");
            }
            // base plate
            translate(v = [0, 0, hp_key_depth - eps]) {
                linear_extrude(height = base_thickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) {
                    offset(r = outer_thickness, chamfer = false) humla_pcb();
                }
            }
        }
        mcu_switch_cutout();
    }
}

// A simple bumper case for the humla. This can be glued to the top of the laptop adaptor plate.
module humla_bumper_case() {
    translate(v = [0, 0, hp_key_depth - eps])
        difference() {
        //linear_extrude(height = case_thickness) {
        chamfer_extrude(height = case_thickness, faces = "top") {
            offset(r = outer_thickness, chamfer = false) humla_pcb();
        }
        translate(v = [0, 0, base_thickness]) {
            linear_extrude(height = humla_thickness + eps, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) {
                offset(delta = pcb_tol, chamfer = false) humla_pcb();
            }
        }
        mcu_switch_cutout();
    }
}

part = "bumper-case";
explode = 1;
if (part == "laptop-adaptor") {
    laptop_keyboard_adaptor_plate();
} else if (part == "bumper-case") {
    humla_bumper_case();
} else if (part == "assembled") {
    color("silver") laptop_keyboard_adaptor_plate();
    translate(v = [0, 0, base_thickness]) {
        color("red") humla_bumper_case();
        //translate(v = [0, 0, hp_key_depth + case_thickness - 1]) color("#222222") linear_extrude(height = 1) humla_pcb();
    }
 }

// Requires my utility functions in your OpenSCAD lib or as local submodule
// https://github.com/Lenbok/scad-lenbok-utils.git
use<../Lenbok_Utils/utils.scad>