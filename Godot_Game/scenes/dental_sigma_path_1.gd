extends Node2D


var dab: bool = false
var start: bool = true
var start_after: bool = false
var granny_rotation: int = 0
var throw_salami: bool = false
var leaving: bool = false

var salami_1: bool = false



func _ready():
	$Granny/PointLight2D.energy = 0
func _process(delta):
	starting_up(delta)

func starting_up(delta):
	if (start):
		if ($Trevor.position.x > 450 && $Trevor.position.y > 400):
			$Trevor.scale.x -= (1 * delta)
			$Trevor.scale.y -= (1 * delta)
			$Trevor.position.x -= (300 * delta)
			$Trevor.position.y -= (100 * delta)
			
		else:
			start = false
			start_after = true
	if (start_after):
		if ($Granny.position.y < 160):
			$Granny/PointLight2D.energy = .5
			$Granny.position.y += (150 * delta)
		else:
			start_after = false
			DialogueManager.show_example_dialogue_balloon(load("res://dialog/conversation.dialogue"), "Talking_to_Granny")
	if (Entrance.give_salami_first):
		$Salami.position.x = ($Trevor.position.x + 20)
		$Salami.position.y = ($Trevor.position.y + 20)
		#start_position = $Salami.position
		#end_position = $Trevor.position
		#$TImerSalami.start()
		
		# if more time add the Salami throwing into Trevors hands.
		salami_1 = true
	
	if (salami_1 && !Entrance.give_salami_first):
		$Salami.position.x += (400 * delta)
		$Salami.position.y += (400 * delta)
	
	if (salami_1 && Entrance.sigma_selected):
		if ($Trevor.position.x < 1000 && $Trevor.position.y < 770):
			$Trevor.scale.x += (1 * delta)
			$Trevor.scale.y += (1 * delta)
			$Trevor.position.x += (300 * delta)
			$Trevor.position.y += (100 * delta)
		else:
			leaving = true
			salami_1 = false
			Entrance.give_salami_first = false
			Entrance.sigma_selected = false 
	
	if (leaving):
		get_tree().change_scene_to_file("res://scenes/dairy_sigma_path_2.tscn")

	#if (Entrance.sigma_selected):
		#if ($Trevor.position.x <= 1000 && $Trevor.position.y > 325):
			#$Trevor.position.x += (200 * delta)
			#$Trevor.position.y -= (100 * delta)
		#elif ($Trevor.scale.x > 5 && $Trevor.position.y > 5):
			#if (!dab):
				#$"Trevor/Idle-Walking".hide()
				#$Trevor/dab.show()
				#dab = true
			#$Trevor.scale.x -= (2 * delta)
			#$Trevor.scale.y -= (2 * delta)
			#$Trevor.position.y -= (15 * delta)
			#$Trevor.position.x -= (30 * delta)
		#else:
			#Entrance.sigma_selected = false
