extends Node2D


@onready var antScene = preload("res://ant.tscn")
@onready var slugScene = preload("res://slug.tscn")

var animated_sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	#get the width and height of the screen
	var enemyInstance = antScene.instantiate() if randf() < 0.5 else slugScene.instantiate()

	var screen_size = get_viewport_rect().size
	var width = screen_size.x
	var height = screen_size.y
	
	var spawnX = -width / 2 - 10 if randf() < 0.5 else width / 2 + 10
	var spawnY = randf_range(-50 - height / 2, 50 + height / 2)

	enemyInstance.position = Vector2(spawnX, spawnY)
	# add instance to the scene
	add_child(enemyInstance)
	pass
