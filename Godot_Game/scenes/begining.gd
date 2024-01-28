extends Node2D

var speed: float = 10

var char_position: Vector2 = Vector2(0, 0) 

var returning_to_store: bool = false

func _ready():
	char_position = Vector2($"Idle-Walking".position.x, $"Idle-Walking".position.y)
	$Timer_trollies.start()
	
func _process(delta):
	if ($Timer_trollies.time_left > 0):
		$"Idle-Walking".position.x += 1000 * delta
	if ($"Timer_outside_forgot-keyes".time_left > 0):
		$"Idle-Walking".scale.x -= (speed * delta) 
		$"Idle-Walking".scale.y -= (speed * delta)
		if (returning_to_store):
			$"Idle-Walking".scale.x -= ((speed + 2) * delta) 
			$"Idle-Walking".scale.y -= ((speed + 2) * delta)
	if ($"Timer-outside".time_left > 0):
		$"Idle-Walking".scale.x += (speed * delta) 
		$"Idle-Walking".scale.y += (speed * delta)

func _on_timer_trollies_timeout():
	$Timer_trollies.stop()
	$Trollies.hide()
	$outside.show()
	$"Idle-Walking".position.x = 633
	$"Idle-Walking".position.y = 350
	$"Timer_outside_forgot-keyes".start()
	


func _on_timeroutside_timeout():
	$"Timer-outside".stop()
	$"Timer_outside_forgot-keyes".start()
	DialogueManager.show_example_dialogue_balloon(load("res://dialog/diglog_begining.dialogue"), "Nevermind")
	#$"Timer_outside_forgot-keyes".wait_time += 4

func _on_timer_outside_forgotkeyes_timeout():
	$"Timer_outside_forgot-keyes".stop()
	if (!returning_to_store):
		$"Timer-outside".start()
		returning_to_store = true
		DialogueManager.show_example_dialogue_balloon(load("res://dialog/diglog_begining.dialogue"), "Forgot_Keys")
	else:
		get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
