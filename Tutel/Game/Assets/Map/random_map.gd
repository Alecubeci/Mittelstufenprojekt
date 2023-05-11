extends Node3D

class_name GenerateMap 

# Variablen zur Konfiguration der Karte
var map_width = 60
var map_depth = 60
var path_width = 3
var path_depth = 3
var tile_size = 1
var max_straight = 5  # erhöht die maximale Anzahl an Tiles, die der Pfad geradeaus gehen kann
var turn_prob = 0.75   # erhöht die Wahrscheinlichkeit, dass der Pfad die Richtung ändert


# Die verschiedenen Tile-Typen
const GRASS_TILE = 0
const PATH_TILE = 1

# Das Tile-Array
var map_data = []


# Start- und Endpunkt des Pfades
var path_start = Vector3(5, 0, 0)
var path_end = Vector3(55, 0, 59)

signal map_generated

# WaveSpawning
var enemy_scene = preload("res://Game/Assets/Enemy/enemy.tscn")
var max_enemies_per_wave = 10

func _ready():
	$Spawntimer.connect("timeout", self._on_SpawnTimer_timeout)
	# Erstelle die Karte
	generate_map()


func generate_map():
	var path = [path_start]
	var visited = []
	var num_paths = 0


	var grass_material = StandardMaterial3D.new()
	grass_material.albedo_color = Color(0, 1, 0)

	var path_material = StandardMaterial3D.new()
	path_material.albedo_color = Color(1, 0, 0)

	var grass_tile = BoxMesh.new()
	var path_tile = BoxMesh.new()

	var current_pos = path_start
	var end_pos = path_end
	var num_straight = 0  # Anzahl der Tiles, die der Pfad geradeaus gegangen ist
	while current_pos != end_pos:
	# Bestimme mögliche Richtungen (nicht zurück)
		var directions = []
		if current_pos.x < end_pos.x:
			directions.append(Vector3(1,0,0))
		if current_pos.z < end_pos.z:
			directions.append(Vector3(0,0,1))
		if current_pos.x > end_pos.x:
			directions.append(Vector3(-1,0,0))
		if current_pos.z > end_pos.z:
			directions.append(Vector3(0,0,-1))
		if num_straight >= max_straight:
			directions.append(-1 * path[-1] / tile_size) # füge Möglichkeit für umgekehrte Bewegung hinzu

	# Wähle zufällige Richtung
		var dir = Vector3.ZERO
		if len(directions) > 0:
			if num_straight >= max_straight:  # Richtungswechsel nach maximaler Anzahl an geraden Tiles
				dir = directions[randi() % len(directions)]
				num_straight = 0
			else:
				if randf() < turn_prob and num_straight > 0:  # erhöhte Wahrscheinlichkeit für Richtungswechsel
					dir = directions[randi() % len(directions)]
					num_straight = 0
				else:
					dir = directions[randi() % len(directions)]
					num_straight += 1
		else:
			if len(path) > 1:
				dir = -1 * (path.pop() - current_pos) / tile_size
			else:
				break
		current_pos += dir*tile_size
		path.append(current_pos)
		



	var y = 0.0
	for x in range(0, map_width):
		var z = 0.0
		for i in range(map_depth):
			var tile = MeshInstance3D.new()
			if Vector3(x*tile_size, y, z*tile_size) in path:
				tile.mesh = BoxMesh.new()
				tile.mesh.surface_set_material(0, path_material)
				visited.append(true)
				num_paths += 1
			else:
				tile.mesh = BoxMesh.new() 
				tile.mesh.surface_set_material(0, grass_material)
				visited.append(false)
			tile.transform.origin = Vector3(x * tile_size, y, z * tile_size)
			add_child(tile)
			z += tile_size
		y += 0.0  # Hält alle Tiles auf gleicher Höhe
	emit_signal("map_generated")

#func _on_map_generated():
#	initialize_enemy_pathing()
#
#func initialize_enemy_pathing():
#	var enemy = get_node("Enemy")
#	enemy.call_deferred("initialize_pathing")


func _on_SpawnTimer_timeout():
	for _i in range(max_enemies_per_wave):
		spawn_enemy()

func spawn_enemy():
	if enemy_scene:
		var enemy_instance = enemy_scene.instantiate()
		add_child(enemy_instance)
		enemy_instance.transform.origin = Vector3(path_start.x,2,path_start.z)
	else:
		print("Enemy scene not loaded:", enemy_scene)
