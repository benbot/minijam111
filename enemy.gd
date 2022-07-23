extends Area3D

@export var speed := 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	# self.input_event.connect(get_joint_one_length)

func _physics_process(delta):
	global_transform.origin.x += speed * delta