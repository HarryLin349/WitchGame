extends CharacterBody2D

class_name Player

# Define the speed of the character
var health: int = 200
var maxHealth: int = 200
var damage: int = 1
var attackCooldown: float = 0.1
var currentCooldown: float = 0.1


func _process(delta):
	# Get the screen's center point (viewport center)
	if currentCooldown > 0:
		currentCooldown -= delta
	velocity = Vector2.ZERO
	var previous_position = position
	var collision = move_and_slide()
	if collision:
		var collided = get_last_slide_collision().get_collider()
		if collided is Enemy:
			attackEnemy(collided)
		position = previous_position
	
func attackEnemy(enemy: Enemy) -> void:
	if (currentCooldown <= 0):
		enemy.take_damage(damage)
		currentCooldown = attackCooldown
			
func take_damage(amount: int):
	GlobalStats.decrease_hp(amount)
	if health <= 0:
		queue_free() # Remove the enemy if health reaches 0
		# END GAME HERE
