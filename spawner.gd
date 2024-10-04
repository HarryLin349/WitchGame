extends Node


@onready var antScene = preload("res://ant.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var antInstance = antScene.instantiate()
	antInstance.position = Vector2(randf_range(-200, 200), randf_range(-200, 200))
	# add instance to the scene
	add_child(antInstance)
	pass
