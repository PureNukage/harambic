scr_player_getinputs()

//Movement
x += (right - left) * movespeed
y += (down - up) * movespeed

//Walking Animation
if (xprevious != x) or (yprevious != y) {
	sprite_index = s_player_run	
} else {
	sprite_index = s_player	
}

//Flip image_xscale when moving to the left
if (xprevious > x) {
	image_xscale = -1	
} else if (xprevious < x) {
	image_xscale = 1
}	

//Punch
if punch {
	sprite_index = s_player_punch1
	playerstates = playerstates.punch1
}