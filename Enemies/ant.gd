extends Enemy

func _ready():
	health = 2
	maxHealth = 2
	damage = 1
	speed = 10
	attackCooldown = 0.3
	currentCooldown = 0.3
	animated_sprite = $AnimatedSprite2D
