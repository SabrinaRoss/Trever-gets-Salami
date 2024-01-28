extends Node2D

var audio:int = 0
var start: bool = true
var start_dialogue: bool = false 
var start_after: bool = false
var start_after_after: bool = false

var granny_rotation: int = 0
var throw_salami: bool = false
var leaving: bool = false

var salami_1: bool = false



func _ready():
	pass
func _process(delta):
	starting_up(delta)
	dialogue_Mikaill_cow(delta)
	
	audio_Mikiall()
func starting_up(delta):
	if (start):
		if ($Trevor.position.y > 685):
			$Trevor.scale.x -= (.2 * delta)
			$Trevor.scale.y -= (.2 * delta)
			$Trevor.position.y -= (200 * delta)
		else:
			start_after = true
		
		if (start_after):
			if ($Mikail_Cow.get_rotation_degrees() < 90):
				$Mikail_Cow.rotate(2 * delta)
				$Mikail_Cow.position.x += (400 * delta)
				$Mikail_Cow.position.y += (400 * delta)
			else: 
				start_after = false
				start_after_after = true
		
		if (start_after_after):
			if ($Mikail_Cow.get_rotation_degrees() < 360):
				$Mikail_Cow.rotate(8 * delta)
				$Mikail_Cow.position.y -= (450 * delta)
				$Mikail_Cow.scale.x -= (4 * delta)
				$Mikail_Cow.scale.y -= (4 * delta)
				salami_1 = true
			elif (salami_1):
				if ($Trevor.position.y > 500):
					$Trevor.scale.x -= (2 * delta)
					$Trevor.scale.y -= (2 * delta)
					$Trevor.position.y -= (150 * delta)
					$Trevor.position.x += (150 * delta)
				else:
					salami_1 = false
					start = false 
					start_dialogue = true
					DialogueManager.show_example_dialogue_balloon(load("res://dialog/Mikaill_cow.dialogue"), "Mikaill_convo")

func dialogue_Mikaill_cow(delta):
	if (start_dialogue && Entrance.sigma_selected):
		if ($Trevor.position.y > 350):
			$Trevor.scale.x -= (4 * delta)
			$Trevor.scale.y -= (4 * delta)
			$Trevor.position.y -= (100 * delta)
			$Trevor.position.x -= (100 * delta)
		else:
			Entrance.sigma_selected = false
			Entrance.sigma_selected = false
			get_tree().change_scene_to_file("res://scenes/protein_scene.tscn")
		
		
		#else:
			#start = false
			#start_after = true
	#if (start_after):
		#if ($Granny.position.y < 160):
			#$Granny/PointLight2D.energy = .5
			#$Granny.position.y += (150 * delta)
		#else:
			#start_after = false
			#DialogueManager.show_example_dialogue_balloon(load("res://dialog/conversation.dialogue"), "Talking_to_Granny")
	#if (Entrance.give_salami_first):
		#$Salami.position.x = ($Trevor.position.x + 20)
		#$Salami.position.y = ($Trevor.position.y + 20)
		#start_position = $Salami.position
		#end_position = $Trevor.position
		#$TImerSalami.start()
		
		# if more time add the Salami throwing into Trevors hands.
		#salami_1 = true
	#
	#if (salami_1 && !Entrance.give_salami_first):
		#$Salami.position.x += (400 * delta)
		#$Salami.position.y += (400 * delta)
	#
	#if (salami_1 && Entrance.sigma_selected):
		#if ($Trevor.position.x < 1000 && $Trevor.position.y < 770):
			#$Trevor.scale.x += (1 * delta)
			#$Trevor.scale.y += (1 * delta)
			#$Trevor.position.x += (300 * delta)
			#$Trevor.position.y += (100 * delta)
		#else:
			#leaving = true
			#salami_1 = false
			#Entrance.give_salami_first = false
			#Entrance.sigma_selected = false 
	#
	#if (leaving):
		#pass
		
func audio_Mikiall():
	if (audio != Entrance.audio):
		match Entrance.audio:
			1:
				$"1".play()
				audio = Entrance.audio
			2:
				$"2".play()
				audio = Entrance.audio
			3:
				$"3".play()
				audio = Entrance.audio
			4:
				$"4".play()
				audio = Entrance.audio
			5:
				$"5".play()
				audio = Entrance.audio
			6:
				$"6".play()
				audio = Entrance.audio
			7:
				$"7".play()
				audio = Entrance.audio
			8:
				$"8".play()
				audio = Entrance.audio
			9:
				$"9".play()
				audio = Entrance.audio
			10:
				$"10".play()
				audio = Entrance.audio
			11:
				$"11".play()
				audio = Entrance.audio
			12:
				$"12".play()
				audio = Entrance.audio
			13:
				$"13".play()
				audio = Entrance.audio
			14:
				$"14".play()
				audio = Entrance.audio
			15:
				$"15".play()
				audio = Entrance.audio
			16:
				$"16".play()
				audio = Entrance.audio
			17:
				$"17".play()
				audio = Entrance.audio
			

