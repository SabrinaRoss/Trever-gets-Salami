extends Node2D


var char_position: Vector2 = Vector2(0, 0) 

var returning_to_store: bool = false

func _ready():
	char_position = Vector2($"Idle-Walking".position.x, $"Idle-Walking".position.y)
	$Timer_trollies.start()
	
func _process(_delta):
	if ($Timer_trollies.time_left > 0):
		$"Idle-Walking".position.x += 10
	if ($"Timer_outside_forgot-keyes".time_left > 0):
		$"Idle-Walking".scale.x -=.05
		$"Idle-Walking".scale.y -=.05
	if ($"Timer-outside".time_left > 0):
		$"Idle-Walking".scale.x +=.05
		$"Idle-Walking".scale.y +=.05
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
	$"Idle-Walking/Dialogue".hide()
	#$"Timer_outside_forgot-keyes".wait_time += 4

func _on_timer_outside_forgotkeyes_timeout():
	$"Timer_outside_forgot-keyes".stop()
	if (!returning_to_store):
		$"Timer-outside".start()
		returning_to_store = true
		$"Idle-Walking/Dialogue".show()
	else:
		get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
