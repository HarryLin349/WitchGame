extends "res://Summons/summon.gd"

class_name Bee

# Bee-specific summon properties
func _ready():
	health = 100
	damage = 1
	speed = 0
	summonCost = 5
	duration = 10.0  # Lasts for 5 seconds

# Override movement behavior (optional)
func _process(delta):
	# The bee can have a simple movement like circling around
	var circle_center = Vector2(0, 0)
	var direction = (circle_center - global_position).normalized()
	velocity = direction * speed

	# Call the parent _process to handle the time-based removal
	super(delta)
	move_and_slide()
