include <lib/rpi.scad>
include <lib/rpi_tilt_gimbal_lib.scad>

$fn = 40;

module leg_holes(thickness = 20)
{
    base_y_offset = -3;
    for( x_offset = [-35, 35] )
    {
        for( y_offset = [0, -159] )
        {
            translate([x_offset, base_y_offset + y_offset, -thickness])
            cylinder(d=3, h=thickness);
            
            translate([x_offset, base_y_offset + y_offset, 0])
            rotate([0, 180, 0])
            base_plate_screw_head_cone(screw_head_radius = 4);
        }
    }
}

module body()
{
    difference()
    {
        union ()
        {
            translate([40, 0, 0])
            rotate([-90, 0, 90])
            scale([8, 8, 8])
            import("./Raspberry_Pi_Drone_/files/NIACAM2.body.stl");
            
            translate([- base_width / 2, y_offset, -base_thickness])
            base();
        }
        union()
        {
            leg_holes();
            
            translate([28, -110, 0])
            rotate([0, 0, 90])
            raspberry_pi_holes(thickness = 12);
        }
    }
}

body();

translate([- camera_mount_width / 2, base_support_length + y_offset, -base_thickness])
//translate([- camera_mount_width / 2, camera_mount_length / 2 + 25, 0])
camera_mount();