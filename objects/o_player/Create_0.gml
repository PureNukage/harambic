//Var Init
movespeed = 5

//Macros
#macro up keyboard_check(ord("W"))
#macro left keyboard_check(ord("A"))
#macro down keyboard_check(ord("S"))
#macro right keyboard_check(ord("D"))


enum playerstates {
	walk,
	punch,
}

playerstates = playerstates.walk
