extends Node3D

@export var initial_offset := -16.0
@export var on := true
var speed := 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var visibility_notifier: VisibleOnScreenNotifier3D = $canseeme
	visibility_notifier.screen_exited.connect(hello)

func hello():
	transform.origin.x = initial_offset

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if on:
		position.x += speed * delta
