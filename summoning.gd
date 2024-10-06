extends Node2D

@onready var beeScene = preload("res://Summons/Bee.tscn")
@onready var mushroomScene = preload("res://Summons/Mushroom.tscn")

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		# Check if the left mouse button was clicked and if you have enough mana
		if event.pressed and GlobalStats.Mana >= Bee.summonCost:
			var world_position = get_global_mouse_position()
			spawn_bee(world_position) if randf() < 0.5 else spawn_mushroom(world_position)
			#spawn_mushroom(world_position)
			GlobalStats.decrease_mana(Bee.summonCost) # Deduct mana when a bee is summoned
		else:
			print("Not enough mana!")
	
func spawn_bee(position: Vector2):
	# Instantiate the bee and set its position to the mouse click location
	var bee_instance = beeScene.instantiate()
	bee_instance.position = position
	add_child(bee_instance)
	
func spawn_mushroom(position: Vector2):
	# Instantiate the bee and set its position to the mouse click location
	var mushroom_instance = mushroomScene.instantiate()
	mushroom_instance.position = position
	add_child(mushroom_instance)
