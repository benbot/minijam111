extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var clouds := get_tree().get_nodes_in_group("clouds")
	for c in clouds:
		c.input_event.connect(thing)

func thing(_cam, input, _pos, _normal, _shape_idx):
	if input is InputEventMouseButton:
		if input.button_index == MOUSE_BUTTON_LEFT and input.pressed:
			print("I love alexis")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
