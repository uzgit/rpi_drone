include <lib/rpi.scad>
include <lib/rpi_tilt_gimbal_lib.scad>

$fn = 60;

module stand()
{
    width = 2;
    translate([-width/2, 0, 0])
    cube([width, 10, 5]);
}

module rear_speed_controller_mount()
{
    length = 17;
    width = 20;
    height = 12;
    difference()
    {
        union()
        {
            translate([-width/2, 0, -height])
            cube([width, length, height]);
        }
        union()
        {
            translate([-width/2, 4, -height])
            cube([width, length-4, height - 4]);
        }
    }
}

speed_controller_mount_x_offset = 38;
speed_controller_mount_y_offset = -85;

module speed_controller_mount()
{
    length = 20;
    width = 10;
    height = 12;
    
    difference()
    {
        union()
        {
            translate([0, -length/2, -height])
            cube([width, length, height]);
        }
        union()
        {
            translate([0, -length/2, -height])
            cube([width-4, length, height - 4]);
        }
    }
}

module power_distribution_board_holes(thickness = 100, screw_hole_diameter = 1.5)
{
    for( x_offset = [-15, 15] )
    {
        for( y_offset = [-15, 15] )
        {
            translate([x_offset, y_offset, -thickness])
            cylinder( d = screw_hole_diameter, h = thickness );
        }
    }
}

module leg_holes(thickness = 20)
{
    base_y_offset = -3;
    for( x_offset = [-35, 35] )
    {
        for( y_offset = [0, -159] )
        {
            translate([x_offset, base_y_offset + y_offset, -thickness])
            cylinder(d=4, h=thickness);
            
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
            
            translate([speed_controller_mount_x_offset, speed_controller_mount_y_offset, 0])
            speed_controller_mount();
            
            translate([-speed_controller_mount_x_offset, speed_controller_mount_y_offset, 0])
            rotate([0, 0, 180])
            speed_controller_mount();
            
            translate([0, -178, 0])
            rear_speed_controller_mount();
            
            tilt_gimbal_base();
        }
        union()
        {
            leg_holes();
            
            translate([28, -110, 0])
            rotate([0, 0, 90])
            raspberry_pi_holes(thickness = 12, screw_hole_diameter = 4);
            
            translate([0, -143.5, 0])
            power_distribution_board_holes();
        }
    }
}

body();

//tilt_gimbal_camera_mount();

//            translate([- camera_mount_width / 2, base_support_length + y_offset + 1, -base_thickness])
////translate([- camera_mount_width / 2, camera_mount_length / 2 + 25, 0])
//            camera_mount();