switch(thugIdleStates)
{
	case thugIdleStates.firstspawn:		//Thug spawns
	
		movespeed = 4							//  Thug's movement speed
		leash = 100								//  Max distance he'll move away from starting X and Y
		startingX = x							//	Starting X position
		startingY = y							//  Starting Y position
		idleTime = irandom_range(50,100)		//  The time we're going to wait before walking
		thugIdleStates = thugIdleStates.idle
	break;
	
	case thugIdleStates.idle:			//Thug is standing still
	
		if idleTime > 0 {
			idleTime--						//Counting down
		} else if idleTime == 0 {
			var _random = irandom_range(0,100)
			if _random >= 50 {
				randomX = irandom_range(x,startingX+leash)			//Determine next X coordinate
			} else {
				randomX = irandom_range(x,startingX-leash)
			}
			var _random = irandom_range(0,100)
			if _random >= 50 {
				randomY = irandom_range(y,startingY+leash)			//Determine next Y coordinate
			} else {
				randomY = irandom_range(y,startingY-leash)
			}
			
			thugIdleStates = thugIdleStates.walk			//Now that we know where we're going, lets go!
		}	
	break;
	
	case thugIdleStates.walk:			//Thug is walking to a coordinate	
		
		//Moving
		if point_distance(x,y,randomX,randomY) >= movespeed {
			move_towards_point(randomX,randomY,movespeed)
		} else {
			idleTime = irandom_range(50,100)
			thugIdleStates = thugIdleStates.idle
		}	
		
		//Playing walking animation
		if currentspeed != 0 {
			sprite_index = s_thug_walk	
		} else {
			sprite_index = s_thug_idle	
		}
		
		//Getting direction
		if direction > 270 {
			Direction = 1	
		} else if (direction > 90 and direction < 270) {
			Direction = -1
		}
		
		//Flip image_xscale if moving to the left
		image_xscale = Direction
		
	break;
}