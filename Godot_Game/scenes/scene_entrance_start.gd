extends Node2D

var dab: bool = false
var start: bool = true
var start_var: int = 0

func _ready():
	pass
		
func _process(delta):
	starting_up(delta)



func starting_up(delta):
	if (start):
		if ($Trevor.position.x > 230 && $Trevor.position.y > 390):
			$Trevor.scale.x += (1 * delta)
			$Trevor.scale.y += (1 * delta)
			$Trevor.position.x -= (200 * delta)
			$Trevor.position.y -= (300 * delta)
		else:
			start = false
			DialogueManager.show_example_dialogue_balloon(load("res://dialog/conversation.dialogue"), "Talking_to_Clerk")
			
	if (Entrance.sigma_selected):
		if ($Trevor.position.x <= 1000 && $Trevor.position.y > 325):
			$Trevor.position.x += (200 * delta)
			$Trevor.position.y -= (100 * delta)
		elif ($Trevor.scale.x > 5 && $Trevor.position.y > 5):
			if (!dab):
				$"Trevor/Idle-Walking".hide()
				$Trevor/dab.show()
				dab = true
			$Trevor.scale.x -= (2 * delta)
			$Trevor.scale.y -= (2 * delta)
			$Trevor.position.y -= (15 * delta)
			$Trevor.position.x -= (30 * delta)
		else:
			Entrance.sigma_selected = false
			get_tree().change_scene_to_file("res://scenes/dental_sigma_path_1.tscn")
			

# for dialog make a tracker for mouse clicks and then switch statement that determines which dialog will be shown
# and at which location




