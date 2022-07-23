extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var clouds := get_tree().get_nodes_in_group("clouds")
	for c in clouds:
		c.input_event.connect(thing(c))



const rainbow_scene = preload("res://rainbow.tscn")
func thing(cloud: Node3D) -> Callable:
	return func (_cam, input, _pos, _normal, _shape_idx):
		if input is InputEventMouseButton:
			if input.button_index == MOUSE_BUTTON_LEFT and input.pressed:
				var rainbow = rainbow_scene.instantiate()
				cloud.add_child(rainbow)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
