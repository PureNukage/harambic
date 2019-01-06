//Var Init
movespeed = 5

up = keyboard_check(ord("W"))
left = keyboard_check(ord("A"))
down = keyboard_check(ord("S"))
right = keyboard_check(ord("D"))

//Macros

enum playerstates {
	walk,
	punch,
}

playerstates = playerstates.walk
