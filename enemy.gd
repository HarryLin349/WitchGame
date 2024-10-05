extends CharacterBody2D

var health: int
var damage: int
var speed: int
var animated_sprite: AnimatedSprite2D

#
#func _init(_health: int, _damage: int, _speed: int):
	#health = _health
	#damage = _damage
	#speed = _speed
	#animated_sprite = $AnimatedSprite2D


# Default movement (for the ant or any enemy that follows the same behavior)
func _process(delta):
	move_towards_center(delta)

func move_towards_center(delta):
	var screen_center = Vector2(0, 0)
	var direction = (screen_center - global_position).normalized()
	velocity = direction * speed
	if (animated_sprite != null):
		animated_sprite.play("walk_right")
		animated_sprite.flip_h = direction.x < 0
	move_and_slide()

	if global_position.distance_to(screen_center) < 10:
		GlobalStats.decrease_hp(damage)
		queue_free() # Remove the node when it reaches the center

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		queue_free() # Remove the enemy if health reaches 0


func spawnAnts():
	var antScene = preload("res://ant.tscn")
	var enemyInstance = antScene.instance()
	enemyInstance.position = Vector2(0, 0)
	add_child(enemyInstance)
