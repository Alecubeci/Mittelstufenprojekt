extends CharacterBody3D

var SPEED = 5.0

var map_generator = GenerateMap.new()
var spawn_position = map_generator.path_start
var path = map_generator.generate_map()
var life = 3


var target_position = Vector3(55, 0, 59)

func _ready():
	#Spawnt den Character an genannter Positiond
	transform.origin = spawn_position
	pass


func get_direction_and_distance_to_target():
	var direction = (target_position - transform.origin).normalized()
	var distance = (target_position - transform.origin).length()
	return {"direction": direction, "distance": distance}


func _physics_process(delta):
	var direction_and_distance = get_direction_and_distance_to_target()
	var direction = direction_and_distance["direction"]
	var distance = direction_and_distance["distance"]
	if distance > 0.1:  # Eine Toleranz, um zu verhindern, dass der Würfel über das Ziel hinausschießt
		transform.origin += direction * SPEED * delta
	else:
		ziel_erreicht()

func ziel_erreicht():
	life = life -1
	queue_free()
	print(life)
	if life <= 0:
		print("Game Over")
# Funktion, um die nächste Position auf dem Pfad zu finden
#func find_next_path_position(current_pos: Vector3) -> Vector3:
#	# Suchen Sie den nächsten Punkt auf dem Pfad, der der aktuellen Position am nächsten liegt
#	var closest_point = map_generator.path[0]
#	for i in range(1, len(map_generator.path)):
#		var distance_to_point = (map_generator.path[i] - current_pos).length()
#		var distance_to_closest = (closest_point - current_pos).length()
#		if distance_to_point < distance_to_closest:
#			closest_point = map_generator.path[i]
#
#	return closest_point

# Gegner folgt dem Pfad
#func follow_path(delta: float):
#	# Finden Sie die nächste Position auf dem Pfad, zu der der Gegner gehen soll
#	var next_pos = find_next_path_position(transform.origin)
#	
#	# Bewegen Sie den Gegner zur nächsten Position auf dem Pfad
#	var velocity = (next_pos - transform.origin).normalized() * SPEED
#	move_and_slide()
