extends Control

# Function to update the health bar.
func update_time(current_time: float, max_time: float) -> void:
	if max_time > 0:
		# Calculate the size ratio of health (clamp to avoid weird sizes)
		var time_ratio = clamp(current_time / max_time, 0, 1)
		# Set the width of ForegroundBar on top of BackgroundBar to represent the current health
		var new_size = $ForegroundBar.size
		new_size.x = $BackgroundBar.size.x * time_ratio - 1
		$ForegroundBar.set_size(new_size)
