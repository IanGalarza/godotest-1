extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus() 
	GlobalAudioStreamPlayer._no_music()

func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/mundo.tscn")


func _on_quit_button_pressed():
	get_tree().quit()



func _on_level_button_pressed():
	get_tree().change_scene_to_file("res://scenes/LevelMenu.tscn")	

