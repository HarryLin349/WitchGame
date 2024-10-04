extends CharacterBody2D

# Define the speed of the character
var speed = 100



func _process(delta):
	# Get the screen's center point (viewport center)
	var screen_center = Vector2(0, 0)

	# Calculate the direction vector from the current position to the center
	var direction = (screen_center - global_position).normalized()

	# Move the character towards the center
	velocity = direction * speed

	# Move and slide the character (since you're using CharacterBody2D)
	move_and_slide()
	if global_position.distance_to(screen_center) < 10:
		queue_free()  # Remove the node from the scene


func _on_timer_timeout() -> void:
	pass # Replace with function body.
