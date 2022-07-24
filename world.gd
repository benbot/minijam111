extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var clouds := get_tree().get_nodes_in_group("clouds")
	var flowers := get_tree().get_nodes_in_group("flowers")
	for c in clouds:
		c.input_event.connect(thing(c))
	for f in flowers:
		f.body_entered.connect(_on_flower_hit(f))
	

func _on_flower_hit(flower: Node3D):
	return func (body: RigidDynamicBody3D):
		flower.color_fill = 2;
		if flower.has_method("update_materials"):
			flower.update_materials()
		body.queue_free()

const rainbow_scene = preload("res://rainbow.tscn")
func thing(cloud: Node3D) -> Callable:
	return func (_cam, input, _pos, _normal, _shape_idx):
		if input is InputEventMouseButton:
			if input.button_index == MOUSE_BUTTON_LEFT and input.pressed:
				var rainbow = rainbow_scene.instantiate()
				add_child(rainbow)
				rainbow.global_transform.origin = cloud.global_transform.origin
				rainbow.scale = Vector3(0.3, 0.3, 0.3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
