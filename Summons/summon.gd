extends CharacterBody2D

class_name Summon

var health: int
var damage: int
var speed: int
static var summonCost: int
var duration: float
var timeElapsed: float = 0.0
var animated_sprite: AnimatedSprite2D

func _ready():
	print("tree", get_tree_string_pretty())

func _process(delta):
	# count time elpsed, if it exceeds duration, remove the summon
	"""
	var circle_center = Vector2(0, 0)
	var direction = (circle_center - global_position).normalized()
	velocity = direction * speed
	"""
	
	timeElapsed += delta
	if timeElapsed > duration:
		queue_free()
		
	move_and_slide()

	pass

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		queue_free() # Remove the enemy if health reaches 0

func go_to_nearest_enemy():
	var closestEnemy = find_nearest_enemy()
	var direction = Vector2.ZERO
	if closestEnemy:
		direction = (closestEnemy.global_position - global_position).normalized()
		velocity = direction * speed
	else:
		# If no enemy is found, you can keep the bee stationary or add other behavior
		velocity = Vector2.ZERO
	if (animated_sprite != null):
		animated_sprite.play("walk_left")
		animated_sprite.flip_h = direction.x > 0

	
func find_nearest_enemy() -> Enemy:
	var nearest_enemy: Enemy = null
	var shortest_distance = INF
	
	# Get all children of the "world" node
	var world = get_parent()
	
	for child in world.get_children():
		print("child:", child)
		# Check if the child is an Enemy (check by class type or node group)
		if child is Enemy:
			var distance = position.distance_to(child.position)
			if distance < shortest_distance:
				shortest_distance = distance
				nearest_enemy = child

	return nearest_enemy

# Called when the node enters the scene tree for the first time.
