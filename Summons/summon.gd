extends CharacterBody2D

var health: int
var damage: int
var speed: int
static var summonCost: int
var duration: float
var timeElapsed: float = 0.0
var animated_sprite: AnimatedSprite2D

#
#func _init(_health: int, _damage: int, _speed: int):
	#health = _health
	#damage = _damage
	#speed = _speed
	#animated_sprite = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# count time elapsed, if it exceeds duration, remove the summon
	timeElapsed += delta
	if timeElapsed > duration:
		queue_free()
	pass

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		queue_free() # Remove the enemy if health reaches 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
