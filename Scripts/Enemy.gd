extends CharacterBody2D


const SPEED = 60
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var moving_left = true

func _ready():
	$AnimationPlayer.play("Walk")

func _process(delta):
	move_character(delta)
	turn()

func move_character(delta):
	velocity.y += gravity * delta
	if (moving_left):
		velocity.x = -SPEED
	else:
		velocity.x =SPEED
	move_and_slide()



func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		body._loseLife(position.x)
		pass

func turn():
	if not $RayCast2D.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x


func _on_left_sensor_body_entered(body):
	if body.is_in_group("grounds"):
		moving_left = !moving_left
		scale.x = -scale.x


func _on_right_sensor_body_entered(body):
	if body.is_in_group("grounds"):
		moving_left = !moving_left
		scale.x = -scale.x
