extends Area3D

@export var material: Material

var color_fill = 0.0;

var materials = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var meshes := $flower.get_children(true)
	for m in meshes:
		if m is MeshInstance3D:
			var new_mat := material.duplicate(true)
			new_mat.next_pass.set_shader_param("threshhold", color_fill)
			m.set_surface_override_material(0, new_mat)
			materials.push_back(new_mat)

func update_materials():
	for m in materials:
		m.next_pass.set_shader_param("threshhold", color_fill)
		print(m.next_pass.get_shader_param("threshhold"))
