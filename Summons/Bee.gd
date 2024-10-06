extends Summon

class_name Bee

# Bee-specific summon properties
func _ready():
	health = 4
	maxHealth = 4
	damage = 2
	speed = 50
	summonCost = 5
	attackCooldown = 0.5
	currentCooldown = 0.5
	duration = 10.0 # Lasts for 5 seconds
	animated_sprite = $AnimatedSprite2D
	animPlayer = $AnimationPlayer
	super()
	
func _process(delta: float) -> void:
	go_to_nearest_enemy()
	super(delta)
