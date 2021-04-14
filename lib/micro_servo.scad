$fn = 60;



module micro_servo()
{
    servo_mount_width = 8.5;
    servo_body_length = 22.5;
    servo_body_width = 12; // square body
    servo_body_height = 22.5;
    servo_axis_length = 15.5;

    mounting_arm_thickness = 2.5;
    mounting_arm_length = 5;
    mounting_arm_height = 15;
    mounting_screw_diameter = 2.5;

    gearbox_cylinder_height = 4;
    major_gearbox_offset = 0.5; // distance from edge
    major_gearbox_cylinder_diameter = 11.5;
    minor_gearbox_offset = 5.5; // distance from major gearbox center
    //minor_gearbox_cylinder_diameter = 5.5;
    minor_gearbox_cylinder_diameter = 6.5; // for simplicity

    control_head_diameter = 5;
    control_head_height = 3;
    
    translate([-servo_body_width / 2, 0, 0])
    translate([0, -servo_body_length + major_gearbox_offset + (major_gearbox_cylinder_diameter / 2), 0])
    translate([0, 0, -(servo_body_height + gearbox_cylinder_height)])
    union()
    {
        cube([servo_body_width, servo_body_length, servo_body_height]);
        
        // forward mounting arm
        translate([0, servo_body_length, mounting_arm_height])
        difference()
        {
            cube([servo_body_width, mounting_arm_length, mounting_arm_thickness]);
            translate([servo_body_width / 2, mounting_arm_length / 2, 0])
            cylinder(d=mounting_screw_diameter, h=mounting_arm_thickness);
        }
        
        // rear mounting arm
        translate([0, -mounting_arm_length, mounting_arm_height])
        difference()
        {
            cube([servo_body_width, mounting_arm_length, mounting_arm_thickness]);
            translate([servo_body_width / 2, mounting_arm_length / 2, 0])
            cylinder(d=mounting_screw_diameter, h=mounting_arm_thickness);
        }
        
        // major gearbox cylinder
        translate([major_gearbox_offset/2, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, 0])
        cylinder(d=major_gearbox_cylinder_diameter, h=gearbox_cylinder_height);
        
        // minor gearbox cylinder
        translate([major_gearbox_offset/2, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, 0])
        translate([0, -minor_gearbox_offset, 0])
        cylinder(d=minor_gearbox_cylinder_diameter, h=gearbox_cylinder_height);
        
        // control head
        translate([0, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, gearbox_cylinder_height])
        cylinder(d=control_head_diameter, h=control_head_height);
    }
}

module micro_servo_void()
{
    servo_mount_width = 9.5;
    servo_body_length = 23.5;
    servo_body_width = 13; // square body
    servo_body_height = 23.5;
    servo_axis_length = 15.5;

    mounting_arm_thickness = 3.5;
    mounting_arm_length = 6;
    mounting_arm_height = 15;
    mounting_screw_diameter = 1.5;
    
    gearbox_cylinder_height = 4.5;
    major_gearbox_offset = 0.5; // distance from edge
    major_gearbox_cylinder_diameter = 12.5;
    minor_gearbox_offset = 5.5; // distance from major gearbox center
    //minor_gearbox_cylinder_diameter = 5.5;
    minor_gearbox_cylinder_diameter = 6.5; // for simplicity

    control_head_diameter = 5;
    control_head_height = 3;
    
    translate([-servo_body_width / 2, 0, 0])
    translate([0, -servo_body_length + major_gearbox_offset + (major_gearbox_cylinder_diameter / 2), 0])
    translate([0, 0, -(servo_body_height + gearbox_cylinder_height)])
    union()
    {
        cube([servo_body_width, servo_body_length, servo_body_height]);
        
        // forward mounting arm
        translate([0, servo_body_length, 0])
        cube([servo_body_width, mounting_arm_length, mounting_arm_thickness + mounting_arm_height]);
        
        // rear mounting arm
        translate([0, -mounting_arm_length, 0])
        cube([servo_body_width, mounting_arm_length, mounting_arm_thickness + mounting_arm_height]);
        
        // major gearbox cylinder
        translate([major_gearbox_offset/2, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, 0])
        cylinder(d=major_gearbox_cylinder_diameter, h=gearbox_cylinder_height);
        
        // minor gearbox cylinder
        translate([major_gearbox_offset/2, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, 0])
        translate([0, -minor_gearbox_offset, 0])
        cylinder(d=minor_gearbox_cylinder_diameter, h=gearbox_cylinder_height);
        
        // control head
        translate([0, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, gearbox_cylinder_height])
        cylinder(d=control_head_diameter, h=control_head_height);
    }
}

module micro_servo_void_with_clearance()
{
    servo_mount_width = 9.5;
    servo_body_length = 23.5;
    servo_body_width = 13; // square body
    servo_body_height = 23.5;
    servo_axis_length = 15.5;

    mounting_arm_thickness = 3.5;
    mounting_arm_length = 6;
    mounting_arm_height = 15;
    mounting_screw_diameter = 1.5;

    // for screw holes only
    orig_mounting_arm_thickness = 2.5;
    orig_mounting_arm_length = 5;
    orig_mounting_arm_height = 15;
    orig_mounting_screw_diameter = 2.5;
    orig_servo_body_width = 12;
    orig_servo_body_length = 22.5;
    screw_clearance = 27; // this is not an accurate measure
    
    gearbox_cylinder_height = 4.5;
    major_gearbox_offset = 0.5; // distance from edge
    major_gearbox_cylinder_diameter = 12.5;
    minor_gearbox_offset = 5.5; // distance from major gearbox center
    //minor_gearbox_cylinder_diameter = 5.5;
    minor_gearbox_cylinder_diameter = 6.5; // for simplicity

    control_head_diameter = 5;
    control_head_height = 3;
    
    translate([-servo_body_width / 2, 0, 0])
    translate([0, -servo_body_length + major_gearbox_offset + (major_gearbox_cylinder_diameter / 2), 0])
    translate([0, 0, -(servo_body_height + gearbox_cylinder_height)])
    union()
    {
        cube([servo_body_width, servo_body_length, servo_body_height]);
        
        // forward mounting arm
        translate([0, servo_body_length, 0])
        cube([servo_body_width, mounting_arm_length, mounting_arm_thickness + mounting_arm_height]);
        
        // forward mounting screw hole/clearance
        translate([0, orig_servo_body_length, 0])
        translate([orig_servo_body_width / 2, orig_mounting_arm_length / 2, 0])
        cylinder(d=mounting_screw_diameter, h=screw_clearance);
        
        // rear mounting arm
        translate([0, -mounting_arm_length, 0])
        cube([servo_body_width, mounting_arm_length, mounting_arm_thickness + mounting_arm_height]);
        
        // rear mounting screw hole/clearance
        translate([0, -orig_mounting_arm_length, 0])
        translate([orig_servo_body_width / 2, mounting_arm_length / 2, 0])
        cylinder(d=mounting_screw_diameter, h=screw_clearance);
        
        // major gearbox cylinder
        translate([major_gearbox_offset/2, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, 0])
        cylinder(d=major_gearbox_cylinder_diameter, h=gearbox_cylinder_height);
        
        // minor gearbox cylinder
        translate([major_gearbox_offset/2, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, 0])
        translate([0, -minor_gearbox_offset, 0])
        cylinder(d=minor_gearbox_cylinder_diameter, h=gearbox_cylinder_height);
        
        // control head
        translate([0, servo_body_length - major_gearbox_offset, servo_body_height])
        translate([major_gearbox_cylinder_diameter / 2, -major_gearbox_cylinder_diameter / 2, gearbox_cylinder_height])
        cylinder(d=control_head_diameter, h=control_head_height);
    }
}

//micro_servo();
//micro_servo_void();
//micro_servo_void_with_clearance();