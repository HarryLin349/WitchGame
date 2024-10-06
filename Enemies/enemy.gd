extends CharacterBody2D

class_name Enemy

var health: int
var maxHealth: int
var damage: int
var speed: int
var attackCooldown: float
var currentCooldown: float
var animated_sprite: AnimatedSprite2D


func _ready():
	add_to_group("enemies")
	print(get_tree().get_nodes_in_group("enemies").size())

# Default movement (for the ant or any enemy that follows the same behavior)
func _process(delta):
	if currentCooldown > 0:
		currentCooldown -= delta

	move_towards_center(delta)

func move_towards_center(delta):
	var screen_center = Vector2(0, 0)
	var direction = (screen_center - global_position).normalized()
	velocity = direction * speed
	if (animated_sprite != null):
		animated_sprite.play("walk_left")
		animated_sprite.flip_h = direction.x > 0

	if global_position.distance_to(screen_center) < 10:
		GlobalStats.decrease_hp(damage)
		queue_free() # Remove the node when it reaches the center

	var collision = move_and_slide()
	if collision:
		var collided = get_last_slide_collision().get_collider()
		if collided is Summon:
			attackSummon(collided)
		elif collided is Player:
			attackPlayer(collided)

func attackSummon(summon: Summon) -> void:
	if (currentCooldown <= 0):
		summon.take_damage(damage)
		currentCooldown = attackCooldown
		
func attackPlayer(player: Player) -> void:
	if (currentCooldown <= 0):
		player.take_damage(damage)
		currentCooldown = attackCooldown
		


func flash_white() -> void:
	print("flash")
	# Set the AnimatedSprite2D to white
	$AnimatedSprite2D.modulate.a = 0.2
	# Wait 0.2 seconds then set it back to normal
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.modulate.a = 1
	
func take_damage(amount: int):
	flash_white()
	health -= amount
	if ($HealthBar):
		$HealthBar.update_health(health, maxHealth)
	if health <= 0:
		queue_free() # Remove the enemy if health reaches 0
