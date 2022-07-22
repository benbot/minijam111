extends RayCast3D

signal clicked(collider)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseMotion:
		var mouse_pos: Vector2 = event.global_position

		global_transform.origin = Vector3(mouse_pos.x, mouse_pos.y, 0.0)
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("clicked", get_collider())
