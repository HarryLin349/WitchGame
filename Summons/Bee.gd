extends Summon

class_name Bee

# Bee-specific summon properties
func _ready():
	health = 100
	damage = 1
	speed = 10
	summonCost = 5
	duration = 10.0 # Lasts for 5 seconds
	animated_sprite = $AnimatedSprite2D
	super()
