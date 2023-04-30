extends CharacterBody3D

const SPEED = 5.0

var map_generator = GenerateMap.new()
var spawn_position = map_generator.path_start
var path = map_generator.generate_map()


@onready var camera = $Camera3D
var param = PhysicsRayQueryParameters3D.new()

func _ready():
	#Spawnt den Character an genannter Positiond
	transform.origin = spawn_position


func _physics_process(delta):
	var space_state = get_world_3d().direct_space_state
	
# Funktion, um die nächste Position auf dem Pfad zu finden
func find_next_path_position(current_pos: Vector3) -> Vector3:
	# Suchen Sie den nächsten Punkt auf dem Pfad, der der aktuellen Position am nächsten liegt
	var closest_point = map_generator.path[0]
	for i in range(1, len(map_generator.path)):
		var distance_to_point = (map_generator.path[i] - current_pos).length()
		var distance_to_closest = (closest_point - current_pos).length()
		if distance_to_point < distance_to_closest:
			closest_point = map_generator.path[i]

	return closest_point

# Gegner folgt dem Pfad
func follow_path(delta: float):
	# Finden Sie die nächste Position auf dem Pfad, zu der der Gegner gehen soll
	var next_pos = find_next_path_position(transform.origin)
	
	# Bewegen Sie den Gegner zur nächsten Position auf dem Pfad
	var velocity = (next_pos - transform.origin).normalized() * SPEED
	move_and_slide()
