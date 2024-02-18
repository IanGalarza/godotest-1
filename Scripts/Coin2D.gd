extends Area2D

signal CoinCollect

func _on_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("CoinCollect")
		queue_free()
		pass 
