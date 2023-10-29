extends Node3D

const speed = 500
const min_rotation = 45
const max_rotation = 135

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = -1
	if Input.is_action_pressed("shift"):
		direction = 1
	for child in get_children():
		var isLeft = child.rotation_degrees.x > 0
		child.rotation_degrees.x = clamp(
			child.rotation_degrees.x + (speed * delta * direction * (1 if isLeft else -1)),
			min_rotation if isLeft else max_rotation * -1,
			max_rotation if isLeft else min_rotation * -1 
		)
