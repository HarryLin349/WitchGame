extends CharacterBody2D

class_name Summon

var health: int
var damage: int
var speed: int
static var summonCost: int
var duration: float
var timeElapsed: float = 0.0
var animated_sprite: AnimatedSprite2D

#func _init(_health: int, _damage: int, _speed: int):
	#health = _health
	#damage = _damage
	#speed = _speed
	#animated_sprite = $AnimatedSprite2D
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	print("tree", get_tree_string_pretty())

func _process(delta):
	# count time elpsed, if it exceeds duration, remove the summon
	"""
	var circle_center = Vector2(0, 0)
	var direction = (circle_center - global_position).normalized()
	velocity = direction * speed
	"""
	
	# Finding the closest enemy
	var closest_enemy = null
	var closest_distance = INF  # Initialize to a large number
	var direction = Vector2(0,0)
	for enemy in get_tree().get_nodes_in_group("enemies"):
		print("found enemy!", enemy.global_position)
		var distance = global_position.distance_to(enemy.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closest_enemy = enemy
			# If a closest enemy is found, home in on it
	if closest_enemy:
		direction = (closest_enemy.global_position - global_position).normalized()
		velocity = direction * speed
	else:
		# If no enemy is found, you can keep the bee stationary or add other behavior
		velocity = Vector2.ZERO
	
	if (animated_sprite != null):
		animated_sprite.play("walk_left")
		animated_sprite.flip_h = direction.x > 0

	timeElapsed += delta
	if timeElapsed > duration:
		queue_free()
		
	move_and_slide()

	pass

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		queue_free() # Remove the enemy if health reaches 0


# Called when the node enters the scene tree for the first time.
