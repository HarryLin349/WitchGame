extends Enemy

func _ready():
	health = 3
	damage = 1
	speed = 100
	attackCooldown = 0.25
	currentCooldown = 0.25
	animated_sprite = $AnimatedSprite2D
