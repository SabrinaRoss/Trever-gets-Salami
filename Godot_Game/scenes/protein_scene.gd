extends Node2D

var dab: bool = false
var start: bool = true
var start_after: bool = false
var granny_rotation: int = 0
var throw_salami: bool = false
var leaving: bool = false

var salami_1: bool = false



func _ready():
	dab = true
	
func _process(delta):
	starting_up(delta)

func starting_up(delta):
	if (start):
		if ($Trevor.position.x < 1500):
			$Trevor.scale.x -= (2.5 * delta)
			$Trevor.scale.y -= (2.5 * delta)
			$Trevor.position.x += (500 * delta)
			$Trevor.position.y -= (125 * delta)
		else:
			start = false 
		if(dab):
			DialogueManager.show_example_dialogue_balloon(load("res://dialog/Mikaill_cow.dialogue"), "gym")
			dab = false
	else:
		if (Entrance.sigma_selected):
			Entrance.sigma_selected = false
			get_tree().change_scene_to_file("res://scenes/butcher_scene.tscn")
