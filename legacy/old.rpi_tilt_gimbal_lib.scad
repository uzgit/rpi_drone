include <rpi.scad>

$fn = 20;

base_support_length = 5;
base_width  = 50;
base_length = 30;
base_thickness = 8;
spacing = 0.5;

hinge_z_offset = 0;

camera_mount_width = 38;
camera_mount_length = 40;
camera_mount_thickness = base_thickness;

camera_indentation_width = 30;
camera_indentation_length = 36;
camera_indentation_thickness = camera_mount_thickness - 3;

camera_hole_center_x = 0;
camera_hole_center_y = 4;
thickness = camera_mount_thickness;

module base()
{
    base_arm_width = base_width - (2 * spacing) ;
    
    difference()
    {
        union()
        {
            // base plate
            translate([0, 0, 0])
            cube([base_width, base_length - base_support_length, base_thickness]);
            
            // hinge cylinder
            translate([0, base_length - base_support_length, base_thickness / 2])
            rotate([0, 90, 0])
            cylinder(d = base_thickness, h = base_width);
            
        }
        union()
        {
            // hinge cylinder hole
            translate([0, base_length - base_support_length, base_thickness / 2])
            rotate([0, 90, 0])
            cylinder(d = 3, h = 70);

            translate([base_width / 2 - camera_mount_width / 2 - spacing, base_support_length - spacing*3, 0])
            cube([camera_mount_width + spacing*2, camera_mount_length + spacing, base_thickness]);
        }
    }
}

module camera_mount()
{
    difference()
    {
        union()
        {
            translate([0, 0, 0])
            cube([camera_mount_width, camera_mount_length, camera_mount_thickness]);
        }
        union()
        {
            // left hinge hole
            translate([0, camera_mount_length / 2 - 1, camera_mount_thickness / 2])
            rotate([0, 90, 0])
            cylinder(d = 3, h = 4);
            
            // right hinge hole
            translate([camera_mount_width - 4, camera_mount_length / 2 - 1, camera_mount_thickness / 2])
            rotate([0, 90, 0])
            cylinder(d = 4.75, h = 4);
            
            // camera module indentation
            translate([(camera_mount_width - camera_indentation_width) / 2, 0, camera_mount_thickness - camera_indentation_thickness])
            cube([camera_indentation_width, camera_indentation_length, camera_indentation_thickness]);
            
            // camera holes
            translate([camera_mount_width / 2, camera_mount_length / 2 + 2, 0])
            rpi_camera_holes(thickness = camera_mount_thickness - camera_indentation_thickness - 2);
        }
    }
}

y_offset = - 3;

translate([- base_width / 2, y_offset, - base_thickness])
base();

//translate([- camera_mount_width / 2, base_length/2, - camera_mount_thickness])
translate([- camera_mount_width / 2, base_support_length + y_offset + 1, - camera_mount_thickness])
////translate([- camera_mount_width / 2, camera_mount_length / 2 + 25, 0])
camera_mount();