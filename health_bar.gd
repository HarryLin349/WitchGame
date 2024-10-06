extends Control

# Function to update the health bar.
func update_health(current_health: float, max_health: float) -> void:
	print("updating health")
	if max_health > 0:
		# Calculate the size ratio of health (clamp to avoid weird sizes)
		var health_ratio = clamp(current_health / max_health, 0, 1)
		print(health_ratio)
		# Set the width of the green bar to represent the current health
		$ForegroundBar.rect_size.x = $BackgroundBar.rect_size.x * health_ratio - 2
