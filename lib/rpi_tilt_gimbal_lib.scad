include <rpi.scad>
include <micro_servo.scad>

// for connecting to the drone
y_offset = -3;

$fn = 20;

width = 38;
length = 40;
thickness = 15;

support_length = 5;
left_arm_width = 8;
right_arm_width = 15;
spacing = 0.5;
rear_spacing = 2;

base_translation_width = (width / 2) + left_arm_width + spacing;
base_tilt_axis_y_offset = support_length + rear_spacing + (length / 2);
mount_tilt_axis_y_offset = length / 2;
right_arm_x_offset = (width / 2) + spacing;

camera_mount_brim = 3; //mm
camera_mount_thickness = 3;

module tilt_gimbal_base()
{
    translate([0, -support_length, -thickness])
    union()
    {
        // base support
        translate([-base_translation_width, 0, 0])
        cube([width + left_arm_width + right_arm_width + (2 * spacing), support_length, thickness]);
        
        // left arm
        difference()
        {
            translate([-base_translation_width, support_length, 0])
            cube([left_arm_width, length + rear_spacing, thickness]);
            
            translate([-base_translation_width, base_tilt_axis_y_offset, thickness / 2])
            rotate([0, 90, 0])
            cylinder(d = 3, h = left_arm_width);
        }
        
        // right arm with servo mount
        difference()
        {
            union()
            {
                translate([right_arm_x_offset, support_length, 0])
                cube([right_arm_width, length + rear_spacing, thickness]);
            }
            union()
            {
                // axis non-contact hole
                translate([right_arm_x_offset, base_tilt_axis_y_offset, thickness / 2])
                rotate([0, 90, 0])
                cylinder(d = 5.5, h = right_arm_width);
                
                // servo void
                translate([right_arm_x_offset, base_tilt_axis_y_offset, thickness/2])
                rotate([0, -90, 0])
                micro_servo_void();
            }
        }
        

    }
}

module tilt_gimbal_camera_mount()
{
    translate([-width/2, rear_spacing, -thickness])
    difference()
    {
        union()
        {
            translate([0, 0, 0])
            cube([width, length, thickness]);
            

        }
        union()
        {
            // indentation
            translate([camera_mount_brim, 0, camera_mount_thickness])
            cube([width - (2 * camera_mount_brim), length - camera_mount_brim, thickness - camera_mount_thickness]);
            
            // camera mounting holes
            translate([width / 2, mount_tilt_axis_y_offset, 0])
            rpi_camera_holes(thickness = camera_mount_thickness);
            
            // left axis hole
            translate([0, mount_tilt_axis_y_offset, thickness / 2])
            rotate([0, 90, 0])
            cylinder(d=3, h=camera_mount_brim);
            
            // right axis hole with servo contact
            translate([width - camera_mount_brim, mount_tilt_axis_y_offset, thickness / 2])
            rotate([0, 90, 0])
            cylinder(d=4.75, h=camera_mount_brim);
        }
    }
}

tilt_gimbal_base();
tilt_gimbal_camera_mount();
