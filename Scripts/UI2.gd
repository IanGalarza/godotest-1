extends CanvasLayer

var coins = 0
var mundo = "/root/mundo2"
var heart1
var heart2
var heart3

func _ready():
	heart1 = get_node("heart1")
	heart2 = get_node("heart2")
	heart3 = get_node("heart3")
	var coinss = get_node(mundo).find_children("Coin2D")
	for coin in coinss:
		coin.connect("CoinCollect",handleCoinCollect)
	$CoinsCollected.text = str(coins)
	GlobalAudioStreamPlayer.play_music_level()

func handleCoinCollect():
	print("Coin Collected")
	coins += 1
	$CoinsCollected.text = str(coins)
	
	if coins == 3:
		get_tree().change_scene_to_file("res://scenes/mundo3.tscn")

func handleHearts(lifes):
	if lifes==0:
		heart1.visible = false
	if lifes==1:
		heart2.visible = false
	if lifes==2:
		heart3.visible = false
