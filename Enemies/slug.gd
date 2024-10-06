extends Enemy


var time_elapsed: float = 0.0
var min_speed: float = 0
var max_speed: float = 15
var speed_duration: float = 8 # The time for one full oscillation\
var random_angle = 0.0
var shouldResetAngle = true 

func _ready():
	health = 6
	maxHealth = 8
	damage = 5
	speed = 5 # Initial speed
	attackCooldown = 0.5
	currentCooldown = 0.5
	animated_sprite = $AnimatedSprite2D
	
# Override the _process function to update speed based on sine wave
func _process(delta):
	# Accumulate time
	time_elapsed += delta
	if time_elapsed >= speed_duration:
		shouldResetAngle = true
		health += 2
		time_elapsed = 0
		
	if speed == 0 and shouldResetAngle:
		random_angle = randf_range(-PI / 4, PI / 4)
		shouldResetAngle = false


	# Adjust the speed using a sine wave: sin(2 * PI * (t / duration)) oscillates between -1 and 1
	var sine_value = cos(2 * PI * (time_elapsed / speed_duration))

	speed = max(sine_value * max_speed, min_speed)
	# Map the sine wave (-1, 1) to the speed range (min_speed, max_speed)
	#speed = lerp(min_speed, max_speed, (sine_value + 1) / 2)
	#var wave_value = sawtooth_wave(time_elapsed, period, amplitude)
  
	# Call the movement logic
	move_rand_towards_center(delta, random_angle)
