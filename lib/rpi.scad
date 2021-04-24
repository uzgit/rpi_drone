module base_plate_screw_head_cone(screw_head_radius = 6, screw_head_depth = 2)
{

    rotate_extrude()
    {
        translate([0, 0, 0]) polygon(points=[[0,0],[screw_head_radius, 0],[0,screw_head_depth]], paths=[[0,1,2]]);
    }
}


module raspberry_pi_holes(thickness = 3, screw_hole_diameter = 3)
{
//    z_offset = -thickness / 2.0;
    z_offset = -thickness;
    for ( x_offset = [3.5, 61.5] )
    {
        for ( y_offset = [3.5, 52.5] )
        {
            union()
            {
                translate([x_offset, y_offset, z_offset]) cylinder(d=screw_hole_diameter, h=thickness);
                translate([x_offset, y_offset, z_offset]) base_plate_screw_head_cone();
            }
        }
    }
}

module raspberry_pi_holes_only(thickness = 3, screw_hole_diameter = 3)
{
//    z_offset = -thickness / 2.0;
    z_offset = -thickness;
    for ( x_offset = [3.5, 61.5] )
    {
        for ( y_offset = [3.5, 52.5] )
        {
            union()
            {
                translate([x_offset, y_offset, z_offset]) cylinder(d=screw_hole_diameter, h=thickness);
            }
        }
    }
}

module raspberry_pi_holes_centered(thickness = 3, screw_hole_diameter = 3)
{
    translate([-49 / 2, -58 / 2, 0])
    union()
    {
        z_offset = -thickness;
        for ( x_offset = [0, 49] )
        {
            for ( y_offset = [0, 58] )
            {
                union()
                {
                    translate([x_offset, y_offset, z_offset]) cylinder(d=screw_hole_diameter, h=thickness);
                }
            }
        }
    }
}

module raspberry_pi_standoffs(standoff_height = 10, standoff_diameter = 5, screw_hole_diameter = 3)
{
    translate([-49 / 2, -58 / 2, -standoff_height])
    union()
    {
        for ( x_offset = [0, 49] )
        {
            for ( y_offset = [0, 58] )
            {
                translate([x_offset, y_offset, 0])
                difference()
                {
                    cylinder(d=standoff_diameter, h=standoff_height);
                    cylinder(d=screw_hole_diameter, h=standoff_height);
                }
            }
        }
    }
}

// camera hole is centered at (0, 0, 0)
//camera_hole_center_x = 0;
//camera_hole_center_y = 6.7;
//module rpi_camera_holes(thickness = 2)
//{
//    wall_thickness = thickness;
//    
//    screw_head_depth = 2;
//    screw_head_radius = 4;
//    
//    translate([0, 0, -wall_thickness + 1])
//    union()
//    {
//        for ( y_offset = [-6.75, 6.25] )
//        {
//            for ( x_offset = [-10.5, 10.5] )
//            {
//                // screw hole
//                translate([camera_hole_center_x + x_offset, camera_hole_center_y+ y_offset, -10])
//                cylinder(h=20, r=1.25);
//                
//                // screw head cone
//                translate([camera_hole_center_x + x_offset, camera_hole_center_y+ y_offset, 0])
//                rotate([0, 0, 0])
//                rotate_extrude()
//                {
//                    translate([0, 0, 0]) polygon(points=[[0,0],[screw_head_radius, 0],[0,screw_head_depth]], paths=[[0,1,2]]);
//                }
//            }
//        }
//    }
//    
//    translate([camera_hole_center_x, camera_hole_center_y - 6.75, -wall_thickness])cube(size = [9.5, 9.5, 9.5], center = true);
//}

// lens center is at (0, 0, 0)
module rpi_camera_holes(thickness = 2, screw_hole_diameter = 2.5)
{
    lens_side_length = 9.5;
    
    union()
    {
        for ( y_offset = [0, 13] )
        {
            for ( x_offset = [-10.5, 10.5] )
            {
                translate([x_offset, y_offset, 0])
                cylinder(d=screw_hole_diameter, h=thickness);
            }
        }
        
        translate([-lens_side_length / 2, -lens_side_length / 2, 0])
        cube([9.5, 9.5, thickness]);
    }
}