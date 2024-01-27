extends Node2D

@export var start_var_upto: int = 130

var start: bool = true
var start_var: int = 0

func _ready():
	pass
		
func _process(_delta):
	starting_up()



func starting_up():
	if (start):
		if (start_var < start_var_upto):
			$"Idle-Walking".scale.x += .01
			$"Idle-Walking".scale.y += .01
			$"Idle-Walking".position.x -= 2
			$"Idle-Walking".position.y -= 3
			start_var += 1
		if (start_var == start_var_upto):
			start = false



# for dialog make a tracker for mouse clicks and then switch statement that determines which dialog will be shown
# and at which location
