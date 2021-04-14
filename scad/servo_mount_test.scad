include <../lib/rpi.scad>
include <../lib/micro_servo.scad>

// for connecting to the drone
y_offset = -3;

$fn = 60;

width = 15;
length = 40;
height = 10;

difference()
{
    translate([-width / 2, -25, -height])
    cube([width, length, height]);
    
    micro_servo_void_with_clearance();
}
