// lens center is at (0, 0, 0)
$fn=60;

module imx219_camera_holes(thickness = 2, screw_hole_diameter = 2.5)
{
    lens_side_length = 9.5;
    
    union()
    {
//        for ( y_offset = [0, 13] )
        for ( y_offset = [-6.5, 6.5] )
        {
            for ( x_offset = [-10.5, 10.5] )
            {
                translate([x_offset, y_offset, 0])
                cylinder(d=screw_hole_diameter, h=thickness);
            }
        }
        
//        translate([-lens_side_length / 2, -lens_side_length / 2, 0])
//        cube([9.5, 9.5, thickness]);
        cylinder(d=15,h=thickness);
    }
}

//imx219_camera_holes();