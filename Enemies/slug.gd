extends Enemy


var time_elapsed: float = 0.0
var min_speed: float = 0
var max_speed: float = 20
var speed_duration: float = 6 # The time for one full oscillation (1 second)

func _ready():
	health = 2
	damage = 2
	speed = 5 # Initial speed
	animated_sprite = $AnimatedSprite2D

# Override the _process function to update speed based on sine wave
func _process(delta):
	# Accumulate time
	time_elapsed += delta

	# Adjust the speed using a sine wave: sin(2 * PI * (t / duration)) oscillates between -1 and 1
	var sine_value = sin(2 * PI * (time_elapsed / speed_duration))

	# Map the sine wave (-1, 1) to the speed range (min_speed, max_speed)
	speed = lerp(min_speed, max_speed, (sine_value + 1) / 2)

	# Call the movement logic
	move_towards_center(delta)
