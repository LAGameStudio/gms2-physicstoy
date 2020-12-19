// turn clockwise
if ( keyboard_check(vk_right) )
    phy_angular_velocity = min(phy_angular_velocity + turn_accel, max_turn_spd);

// turn counterclockwise
if ( keyboard_check(vk_left) )
    phy_angular_velocity = max(phy_angular_velocity - turn_accel, -max_turn_spd);

// forward
if ( keyboard_check(vk_up) ) {
	if ( phy_speed < 30 ) {
     phy_speed_x += lengthdir_x(accel, -phy_rotation);
     phy_speed_y += lengthdir_y(accel, -phy_rotation);
	}
}
// backward
if ( keyboard_check(vk_down) ) {
	if ( phy_speed > -30 ) {
     phy_speed_x -= lengthdir_x(decel, -phy_rotation);
     phy_speed_y -= lengthdir_y(decel, -phy_rotation);
	}
}