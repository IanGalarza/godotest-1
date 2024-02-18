extends CharacterBody2D

const MoveSpeed = 25
const MaxSpeed = 50

const JumpHeight = -300
const Up = Vector2(0,-1)
const Gravity = 15

@onready var Sprite = $Sprite 
@onready var animationPlayer = $animationPlayer

var Motion = Vector2()

func _physics_process(delta):
	
	Motion.y += Gravity
	var Friction = false
	
	if Input.is_action_pressed("ui_right"):
		Sprite.flip_h = true
		animationPlayer.play("Walk")
		Motion.x = min(Motion.x+MoveSpeed, MaxSpeed)
	
	elif Input.is_action_pressed("ui_left"):
		Sprite.flip_h = false
		animationPlayer.play("Walk")
		Motion.x = max(Motion.x-MoveSpeed,-MaxSpeed)
	
	else:
		animationPlayer.play("idle")
		Friction = true
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			Motion.y = JumpHeight
		if Friction == true:
			Motion.x = lerp(Motion.x,0, 0.5)
	else:
		if Friction == true:
			Motion.x = lerp(Motion.x, 0, 0.01)
	Motion = move_and_slide()
	




