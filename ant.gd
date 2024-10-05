extends "res://enemy.gd"

func _ready():
	health = 1
	damage = 1
	speed = 10
	animated_sprite = $AnimatedSprite2D
