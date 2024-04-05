extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

func _animated_npc():
	_animated_sprite.play("idle")

func _physics_process(_delta):
	_animated_npc()
