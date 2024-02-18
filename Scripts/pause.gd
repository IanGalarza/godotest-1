extends Control

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		visible = not get_tree().paused
		get_tree().paused = not get_tree().paused
	if event.is_action_pressed("ReturnMenu") and visible == true:
		get_tree().paused = not get_tree().paused
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
		
