extends Node2D

enum EnemyType {ANT, SLUG}

# Dictionary with creatures and their probabilities
var enemy_dict = {
	EnemyType.ANT: 70,  # 70% chance for ant
	EnemyType.SLUG: 30  # 30% chance for slug
}

func pick_random_enemy() -> int:
	var random_value = randi() % 100
	var accumulated_weight = 0

	for enemy_type in enemy_dict:
		accumulated_weight += enemy_dict[enemy_type]
		if random_value < accumulated_weight:
			return enemy_type
	
	return EnemyType.ANT  # Fallback, in case something goes wrong


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
	var enemyInstance = antScene.instantiate() if randf() < 0.8 else slugScene.instantiate()

	var screen_size = get_viewport_rect().size
	var width = screen_size.x
	var height = screen_size.y
	
	var spawnX = -width / 2 - 10 if randf() < 0.5 else width / 2 + 10
	var spawnY = randf_range(-50 - height / 2, 50 + height / 2)
	
	var random_enemy = pick_random_enemy()
	match random_enemy:
		EnemyType.ANT:
			var numAnts = 2 if randf() < 0.5 else 3
			spawnEnemy(antScene.instantiate(), Vector2(spawnX, spawnY), 3, 0.8)
		EnemyType.SLUG:
			spawnEnemy(slugScene.instantiate(), Vector2(spawnX, spawnY), 1, 0.8)



	spawnEnemy(enemyInstance, Vector2(spawnX, spawnY), 1, 0.8)

	enemyInstance.position = Vector2(spawnX, spawnY)
	# add instance to the scene
	add_child(enemyInstance)
	pass

func spawnEnemy(enemy: Node, spawnPosition: Vector2, amount: int = 1, delay: float = 0.8) -> void:
	for i in range(amount):
		#var enemyInstance = enemy.instance()
		enemy.position = spawnPosition
		add_child(enemy)
		await get_tree().create_timer(delay).timeout

#func spawnSlugs(spawnPosition: Vector2, amount: int)-> void:
	#for i in range(amount):
		#var enemyInstance = slugScene.instance()
		#enemyInstance.position = spawnPosition
		#add_child(enemyInstance)
		#await get_tree().create_timer(1.0).timeout
