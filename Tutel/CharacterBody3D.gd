extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var map_generator = GenerateMap.new()
var spawn_position = map_generator.path_end

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8

@onready var camera = $Camera3D
var param = PhysicsRayQueryParameters3D.new()

func _ready():
	#Spawnt den Character an genannter Positiond
	transform.origin = spawn_position


func _physics_process(delta):
	# get current physical state.
	var space_state = get_world_3d().direct_space_state

	
	
	# get current mouse position.
	var mouse_position = get_viewport().get_mouse_position()
	#print(mouse_position)
	param.from = camera.project_ray_origin(mouse_position)
	param.to = param.from + camera.project_ray_normal(mouse_position) * 2000
	
	var intersection = space_state.intersect_ray(param)
	
	if not intersection.is_empty():
		var pos = intersection.position
		$ShapesMesh.look_at(Vector3(pos.x, position.y, pos.z), Vector3(0, 1, 0))
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
