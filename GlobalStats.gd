extends Node

# Global stats
var HP = 100
var Mana = 0
var max_mana = 200

# Time tracking
var mana_timer = 0.0
var damage_per_second = 10  # Example damage value per second

func _process(delta):
	# Increase Mana
	mana_timer += delta
	if mana_timer >= 0.5:  # Increase Mana every 0.5 seconds
		if Mana < max_mana:
			Mana += 1
		mana_timer = 0.0

func decrease_hp(amount):
	HP -= amount
	if HP < 0:
		HP = 0  # Prevent HP from going below 0

func reset_stats():
	HP = 100
	Mana = 0
