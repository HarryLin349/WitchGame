extends Control

# Function to update the health bar.
func update_health(current_health: float, max_health: float) -> void:
	print("updating health:", current_health, max_health)
	if max_health > 0:
		# Calculate the size ratio of health (clamp to avoid weird sizes)
		var health_ratio = clamp(current_health / max_health, 0, 1)
		print(health_ratio)
		# Set the width of ForegroundBar on top of BackgroundBar to represent the current health
		var new_size = $ForegroundBar.size
		new_size.x = $BackgroundBar.size.x * health_ratio - 1
		$ForegroundBar.set_size(new_size)
