extends Area2D



func _on_body_entered(body):
	if body.get_name() == "Player":
		body._loseLife(position.x)
