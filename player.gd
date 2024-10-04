extends CharacterBody2D


var speed = 100
var last_direction = Vector2.ZERO
var animated_sprite

# setup stuff
func _ready():
	animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
	if direction != Vector2.ZERO:
		last_direction = direction
	
	animatePlayer(direction, last_direction)
	velocity = direction * speed
	move_and_slide()

		
		
func animatePlayer(direction: Vector2, last_direction: Vector2) -> void:
	if direction.x != 0:
		animated_sprite.play("walk_right")
	elif direction.y < 0:
		animated_sprite.play("walk_up")
	elif direction.y > 0:
		animated_sprite.play("walk_down")
	else:
		animateIdle(last_direction)
	animated_sprite.flip_h = last_direction.x < 0

func animateIdle(last_direction: Vector2) -> void:
	if last_direction.x != 0:
		animated_sprite.play("idle_right")
	elif last_direction.y < 0:
		animated_sprite.play("idle_up")
	elif last_direction.y > 0:
		animated_sprite.play("idle_down")
