extends AnimatableBody2D

@export var move_speed = 2

var move_direction = Vector2.LEFT

func _ready():
	$AnimationPlayer.play("SawRot")


func _physics_process(delta):
	move_and_collide(move_direction * move_speed)



func _on_left_sensor_body_entered(body):
	if body.is_in_group("grounds"):
		move_direction = Vector2.RIGHT


func _on_right_sensor_body_entered(body):
	if body.is_in_group("grounds"):
		move_direction = Vector2.LEFT



func _on_saw_body_entered(body):
	if body.get_name() == "Player":
		body._loseLife(position.x)


