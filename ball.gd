extends RigidBody3D

var hasShot = false

const min_z = -2
const max_z = 2
const gravity = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0
	apply_central_impulse(Vector3(0,0,1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func  _physics_process(delta):
	if !hasShot:
		if position.z <= min_z:
			linear_velocity = Vector3.ZERO
			apply_central_impulse(Vector3(0,0,1))
		if position.z >= max_z:
			linear_velocity = Vector3.ZERO
			apply_central_impulse(Vector3(0,0,-1))
		if Input.is_action_just_pressed("space"):
			hasShot = true
			linear_velocity = Vector3.ZERO
			apply_central_impulse(Vector3(0,-2,0))
			gravity_scale = gravity
#	else:
#		apply_central_impulse(Vector3(0,-1 * gravity * delta,0))
