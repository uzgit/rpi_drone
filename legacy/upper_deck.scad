include <../lib/rpi.scad>

$fn=40;

length = 90;
width = 70;
height = 33;

thickness = 1.5;


difference()
{
    union()
    {
        translate([-width / 2 - thickness, -length / 2, 0])
        cube([width + thickness*2, length, height + thickness]);
        
        
    }
    union()
    {
        translate([-width / 2 - thickness, -length / 2, 0])
        translate([thickness, 0, 0])
        cube([width, length, height]);
        
        translate([0, 0, height + thickness])
        raspberry_pi_holes_centered(thickness = thickness, screw_hole_diameter = 3.5);
        
        translate([0, 0, height])
        cylinder(d=10, h=thickness);
    }
}
translate([0, 0, height])
raspberry_pi_standoffs(standoff_diameter = 6, screw_hole_diameter = 3.5);