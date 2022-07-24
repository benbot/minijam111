@tool
extends Node3D

@onready var sphere: MeshInstance3D = $cloud/Sphere

@export var noise: FastNoiseLite

@export_range(0.0, 1.0) var blueLightningSize = 0.4
@export_range(0.0, 1.0) var yellowLightningSize = 0.4
@export_range(0.0, 1.0) var redLightningSize = 0.4

@export var blueLightningPos: Vector3 = Vector3.ZERO
@export var redLightningPos: Vector3 = Vector3.ZERO
@export var yellowLightningPos: Vector3 = Vector3.ZERO
var mesh: ShaderMaterial
var blue: Material
var red: Material
var yellow: Material

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh = sphere.get_active_material(0).duplicate(true)
	blue = mesh.next_pass
	red = blue.next_pass
	yellow = red.next_pass
	sphere.set_surface_override_material(0, mesh)

	blue.set_shader_param("scale", scale.x)
	red.set_shader_param("scale", scale.x)
	yellow.set_shader_param("scale", scale.x)

	blue.set_shader_param("boltSize", blueLightningSize)
	red.set_shader_param("boltSize", redLightningSize)
	yellow.set_shader_param("boltSize", yellowLightningSize)

	blue.set_shader_param("boltLocation", blueLightningPos)
	red.set_shader_param("boltLocation", redLightningPos)
	yellow.set_shader_param("boltLocation", yellowLightningPos)
