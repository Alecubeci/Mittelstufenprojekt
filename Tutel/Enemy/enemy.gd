extends CharacterBody3D

const SPEED = 5.0

var map_generator = GenerateMap.new()
var spawn_position = map_generator.path_start


@onready var camera = $Camera3D
var param = PhysicsRayQueryParameters3D.new()

func _ready():
	#Spawnt den Character an genannter Positiond
	transform.origin = spawn_position


func _physics_process(delta):
	# get current physical state.
	var space_state = get_world_3d().direct_space_state

