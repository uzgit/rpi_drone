include <../lib/rpi.scad>

$fn=40;

length = 160;
width = 80;
height = 4;

thickness = 1.5;

module upper_deck_holes(thickness = 100, screw_hole_diameter = 1.75)
{
    square_side_length = 35;
    
    for( x_offset = [-square_side_length, square_side_length] )
    {
        for( y_offset = [-square_side_length, square_side_length] )
        {
            translate([x_offset, y_offset, 0])
            cylinder( d = 3.5, h = height );
        }
    }
}

difference()
{
    translate([-width / 2, -length / 2, 0])
    union()
    {
        cube([width, length, height]);
    }
    union()
    {
        upper_deck_holes();
    }
}

