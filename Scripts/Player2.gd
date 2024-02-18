extends CharacterBody2D

const SPEED = 50
const JUMP_VELOCITY = -300.0
const RUNSPEED = 100

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer
var contador = 0

var lifes = 3

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_up") and contador != 1:
		velocity.y = JUMP_VELOCITY
		contador += 1
	
	if is_on_floor():
		contador = 0
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and Input.is_action_pressed("ui_accept"):
		velocity.x = direction * RUNSPEED
		animationPlayer.play("Walk")
		if Input.is_action_pressed("ui_right"):
			sprite.flip_h = true
		elif Input.is_action_pressed("ui_left"):
			sprite.flip_h = false
	elif direction:
		velocity.x = direction * SPEED
		animationPlayer.play("Walk")
		if Input.is_action_pressed("ui_right"):
			sprite.flip_h = true
		elif Input.is_action_pressed("ui_left"):
			sprite.flip_h = false
	else:
		animationPlayer.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _loseLife (enemypos):
	if position.x < enemypos:
		velocity.x = -400
		velocity.y = -200
	if position.x > enemypos:
		velocity.x = 400
		velocity.y = -200
	lifes -= 1
	var canvasLayer = get_node("/root/mundo2").find_child("CanvasLayer")
	canvasLayer.handleHearts(lifes)
	if lifes == 0:
		get_tree().reload_current_scene()
	
	
	
