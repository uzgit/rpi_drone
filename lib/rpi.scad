module base_plate_screw_head_cone(screw_head_radius = 6, screw_head_depth = 2)
{

    rotate_extrude()
    {
        translate([0, 0, 0]) polygon(points=[[0,0],[screw_head_radius, 0],[0,screw_head_depth]], paths=[[0,1,2]]);
    }
}


module raspberry_pi_holes(thickness = 3)
{
//    z_offset = -thickness / 2.0;
    z_offset = -thickness;
    for ( x_offset = [3.5, 61.5] )
    {
        for ( y_offset = [3.5, 52.5] )
        {
            union()
            {
                translate([x_offset, y_offset, z_offset]) cylinder(d=3, h=thickness);
                translate([x_offset, y_offset, z_offset]) base_plate_screw_head_cone();
            }
        }
    }
}