extends Control


func _ready():
	$VBoxContainer/Level1.grab_focus() 

func _process(delta):
	pass

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/mundo.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/mundo2.tscn")


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://scenes/mundo3.tscn")


func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://scenes/mundo4.tscn")


func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://scenes/mundo5.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
