extends Node2D

var player = get_node("/root/mundo").find_children("Player")

func _ready():
	if player.floor() == true:
		GlobalAudioStreamPlayer.play_music_level()





