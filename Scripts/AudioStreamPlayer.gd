extends AudioStreamPlayer

const level_music = preload("res://music and sound/music/friday-night.mp3")
const mute_music = preload("res://music and sound/music/DescargarBot_x0455o57x65on21.mp3")

func _play_music(music: AudioStream):
	if stream == music:
		return
	stream = music
	volume_db = 0.0
	play()
	
func play_music_level():
	_play_music(level_music)
	

func _no_music():
	_play_music(mute_music)




