//$fn = 60;

base_support_length = 5;
base_width  = 50;
base_length = 30;
base_thickness = 6;
spacing = 0.5;

hinge_z_offset = 0;

camera_mount_width = 38;
camera_mount_length = 40;
camera_mount_thickness = base_thickness;

camera_indentation_width = 30;
camera_indentation_length = 36;
camera_indentation_thickness = 3;

camera_hole_center_x = 0;
camera_hole_center_y = 4;
thickness = camera_mount_thickness;

servo_height = 12.5;
servo_length = 22.5;
servo_hole_height = 5.5;
servo_hole_diameter = 1.5;
servo_pillar_width = 5;
distance_from_mount_to_arm = 16;

wall_thickness = 1;

module rpi_camera_holes()
{
    screw_head_depth = 2;
    screw_head_radius = 4;
    
    translate([0, 0, -wall_thickness + 1])
    union()
    {
        for ( y_offset = [-6.75, 6.25] )
        {
            for ( x_offset = [-10.5, 10.5] )
            {
                // screw hole
                translate([camera_hole_center_x + x_offset, camera_hole_center_y+ y_offset, -10])
                cylinder(h=20, r=1.25);
                
                // screw head cone
                translate([camera_hole_center_x + x_offset, camera_hole_center_y+ y_offset, 0])
                rotate([0, 0, 0])
                rotate_extrude()
                {
                    translate([0, 0, 0]) polygon(points=[[0,0],[screw_head_radius, 0],[0,screw_head_depth]], paths=[[0,1,2]]);
                }
            }
        }
    }
    
    translate([camera_hole_center_x, camera_hole_center_y - 6.75, -wall_thickness])cube(size = [9.5, 9.5, 9.5], center = true);
}

module servo_mount()
{
    difference()
    {
        union()
        {
            cube([4, servo_pillar_width, servo_height]);
            translate([0, servo_length + servo_pillar_width, 0])
            cube([4, servo_pillar_width, servo_height]);
        }
        union()
        {
            translate([0, servo_pillar_width / 2, servo_hole_height])
            rotate([0, 90, 0])
            cylinder( d = servo_hole_diameter, h = 4);
            
            translate([0, servo_length + servo_pillar_width, 0])
            translate([0, servo_pillar_width / 2, servo_hole_height])
            rotate([0, 90, 0])
            cylinder( d = servo_hole_diameter, h = 4);
        }
    }
}

module base()
{
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
            cylinder(d = 6, h = base_width);
            
        }
        union()
        {
            // hinge cylinder hole
            translate([0, base_length - base_support_length, base_thickness / 2])
            rotate([0, 90, 0])
            cylinder(d = 3, h = 70);
            
//            translate([base_width / 2 - camera_mount_width / 2 - spacing, camera_mount_length / 2 - spacing, -5])
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
            
            // left hinge base
//            translate([0, camera_mount_length / 2, camera_mount_thickness / 2])
//            rotate([0, 90, 0])
//            cylinder(d = 6, h = 4);
            
            // right hinge base (with servo arm)
            translate([camera_mount_width - 4, camera_mount_length / 2 - 3, 0])
//            rotate([0, 90, 0])
            cube([4, 6, 22]);
//            translate([camera_mount_width - 4, camera_mount_length / 2, 0])
//            rotate([0, 90, 0])
//            cylinder(d = 6, h = 4);
        }
        union()
        {
            // left hinge hole
            translate([0, camera_mount_length / 2, camera_mount_thickness / 2])
            rotate([0, 90, 0])
            cylinder(d = 3, h = 4);
            
            // right hinge hole
            translate([camera_mount_width - 4, camera_mount_length / 2, camera_mount_thickness / 2])
            rotate([0, 90, 0])
            cylinder(d = 3, h = 4);
            
            // servo arm holes
            for( z_offset = [20, 18, 16, 14, 12, 10, 8] )
            {
                translate([camera_mount_width - 4, camera_mount_length / 2, hinge_z_offset + z_offset])
                rotate([0, 90, 0])
                cylinder(d = 1, h = 10);
            }
            
            // camera thickness indentation
            translate([(camera_mount_width - camera_indentation_width) / 2, 0, camera_indentation_thickness])
            cube([camera_indentation_width, camera_indentation_length, camera_indentation_thickness]);
            
            // camera holes
            translate([camera_mount_width / 2, camera_mount_length / 2, 0])
            rpi_camera_holes();
        }
    }
}

y_offset = - 3;
//
//translate([- base_width / 2, y_offset, - base_thickness])
//base();
//
////translate([- camera_mount_width / 2, base_length/2, - camera_mount_thickness])
//translate([- camera_mount_width / 2, base_support_length + y_offset, - camera_mount_thickness])
//////translate([- camera_mount_width / 2, camera_mount_length / 2 + 25, 0])
//camera_mount();