extends CanvasLayer


@onready var hp_label = $HPLabel
@onready var mana_label = $ManaLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update the labels with current HP and Mana values
	hp_label.text = "HP: " + str(GlobalStats.HP)
	mana_label.text = "Mana: " + str(GlobalStats.Mana)
