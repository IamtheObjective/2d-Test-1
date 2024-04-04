extends CharacterBody2D

signal hit
@export var speed = 100
@onready var _animated_sprite = $AnimatedSprite2D
var movement = 0
var input_direction = "none"

func get_input():
	
	if Input.is_action_pressed("movement_up"):
		movement = 1
		input_direction = "up"
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("movement_down"):
		movement = 1
		input_direction = "down"
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("movement_right"):
		movement = 1
		input_direction = "right"
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("movement_left"):
		movement = 1
		input_direction = "left"
		velocity.x = -speed
		velocity.y = 0
	else:
		movement = 0
		velocity.x = 0
		velocity.y = 0

func _player_animation():
	if input_direction == "up":
		if movement == 1:
			_animated_sprite.play("moving_up")
		else:
			_animated_sprite.play("idle_up")
	elif input_direction == "down":
		if movement == 1:
			_animated_sprite.play("moving_down")
		else:
			_animated_sprite.play("idle_down")
	elif input_direction == "right":
		_animated_sprite.flip_h = false
		if movement == 1:
			_animated_sprite.play("moving_side")
		else:
			_animated_sprite.play("idle_side")
	elif input_direction == "left":
		_animated_sprite.flip_h = true
		if movement == 1:
			_animated_sprite.play("moving_side")
		else:
			_animated_sprite.play("idle_side")

func _physics_process(_delta):
	get_input()
	_player_animation()
	move_and_slide()
