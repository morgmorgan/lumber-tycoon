extends CharacterBody3D

@onready var camera_mount = $CameraMount
@onready var visuals = $Visuals

@export var SPEED : float = 1.75

@export_group("Sensitivity")
@export_range(0,10) var horizontal_sensitivity = 1
@export_range(0,10) var vertical_sensitivity = 1

var interaction_target : Node = null

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		visuals.look_at(position + direction)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	# Handle Camera
	var camera_input = Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down")
	rotate_y(deg_to_rad(-camera_input.x * horizontal_sensitivity))
	camera_mount.rotate_x(deg_to_rad(-camera_input.y * vertical_sensitivity))
