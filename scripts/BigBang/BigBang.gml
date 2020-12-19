function BigBang() 
{
	
	var person1 = instance_create_layer( room_width / 4, room_height / 2, "Instances", o_Person );
	
	var caribiner = instance_create_layer( room_width / 4, room_height / 2, "Instances", o_ChainEnd );
	
	    link = physics_joint_distance_create(person1, caribiner, person1.x, person1.y, caribiner.x, caribiner.y, false);
	    physics_joint_set_value(link, phy_joint_damping_ratio, 100);
	    physics_joint_set_value(link, phy_joint_frequency, 10);
	
	var segments_precision = 30;
	
	var offset_x = room_width / 4 / segments_precision;
	var next_rope = instance_create_layer(person1.x + offset_x, person1.y, "Ropes", o_ChainLink);

	var attach = physics_joint_distance_create(caribiner, next_rope, caribiner.x, caribiner.y, next_rope.x, next_rope.y, false);;
	physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
	physics_joint_set_value(attach, phy_joint_frequency, 10);

	with(next_rope){
	    previous_link = caribiner.id;
	}

	var segments;
	segments[0]=next_rope;

	var last_rope=next_rope,link;
	var segment_count=1;
	repeat (segments_precision) {	    
	    next_rope = instance_create_layer(person1.x  + offset_x * (segment_count+1), person1.y, "Ropes", o_ChainLink);
	    
	    var link = physics_joint_distance_create(last_rope, next_rope, last_rope.x, last_rope.y, next_rope.x, next_rope.y, false);
	    physics_joint_set_value(link, phy_joint_damping_ratio, 1);
	    physics_joint_set_value(link, phy_joint_frequency, 10);
	    
	    with(next_rope){
	        previous_link = last_rope;
	    }
		segments[segment_count] =next_rope;
		segment_count++;
	    last_rope = next_rope;
	}

	
	var anchor = instance_create_layer( room_width / 2 , room_height / 2 , "Instances", o_ChainStart );
	    
	    
	
	var boulder = instance_create_layer( room_width / 2 , room_height / 2 , "Instances", o_Boulder );
	
	
	    link = physics_joint_distance_create(last_rope, anchor, last_rope.x, last_rope.y, anchor.x, anchor.y, false);
	    physics_joint_set_value(link, phy_joint_damping_ratio, 1);
	    physics_joint_set_value(link, phy_joint_frequency, 10);
		
	    link = physics_joint_distance_create(anchor, boulder, anchor.x, anchor.y, boulder.x, boulder.y, false);
	    physics_joint_set_value(link, phy_joint_damping_ratio, 1);
	    physics_joint_set_value(link, phy_joint_frequency, 10);
	
	//var person2 = instance_create_layer( room_width * 0.75, room_height / 2, "Instances", o_Person );

}