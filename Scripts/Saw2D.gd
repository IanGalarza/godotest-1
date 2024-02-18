extends Area2D

@onready var animationSaw = $AnimationPlayer

func _ready():
	animationSaw.play("RotateSaw")

func _on_body_entered(body):
	if body.get_name() == "Player":
		get_tree().reload_current_scene()
