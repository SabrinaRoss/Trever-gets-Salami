extends Node2D

var speed: float = 8
var dance: bool = false
var time: bool = true
var char_position: Vector2 = Vector2(0, 0) 

var returning_to_store: bool = false

func _ready():
	pass
func _process(delta):
	if ($"Idle-Walking".position.y < 500):
		$"Idle-Walking".scale.x += ((speed + 2) * delta) 
		$"Idle-Walking".scale.y += ((speed + 2) * delta)
		$"Idle-Walking".position.y += (100 * delta)
	else:
		dance = true
		
	if (dance):
		$Trevor_dance.position = $"Idle-Walking".position
		$Trevor_dance.scale = $"Idle-Walking".scale
		$"Idle-Walking".hide()
		$Trevor_dance.show()
		if (time):
			$Timerdance.start()
			time = false
	


func _on_timerdance_timeout():
	get_tree().change_scene_to_file("res://characters/credits.tscn")
