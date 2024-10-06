extends Summon

class_name Mushroom 
# Bee-specific summon properties
func _ready():
	health = 100
	damage = 1
	speed = 0
	summonCost = 5
	animated_sprite = $AnimatedSprite2D
	duration = 10.0  # Lasts for 10 seconds

# Override movement behavior (optional)
func _process(delta):
	# The mushroom doesn't move
	# Call the parent _process to handle the time-based removal
	go_to_nearest_enemy()
	super(delta)
