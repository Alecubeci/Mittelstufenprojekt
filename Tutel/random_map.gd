extends Node3D

# Variablen zur Konfiguration der Karte
var map_width = randi_range(20,60)
var map_depth = randi_range(20,60)
var path_width = 3
var path_depth = 3
var tile_size = 1

# Die verschiedenen Tile-Typen
const GRASS_TILE = 0
const PATH_TILE = 1

# Das Tile-Array
var map_data = []

func _ready():
	# Erstelle die Karte
	generate_map()

func generate_map():
	var path_start_x = randi() % map_width
	var path = []
	var visited = []
	var num_paths = 0

	var grass_material = StandardMaterial3D.new()
	grass_material.albedo_color = Color(0, 1, 0)
	

	var path_material = StandardMaterial3D.new()
	path_material.albedo_color = Color(1, 0, 0)


	var grass_tile = BoxMesh.new()
	var path_tile = BoxMesh.new()

	var y = 0.0
	for x in range(0, map_width):
		var z = 0.0
		for i in range(map_depth):
			var tile = MeshInstance3D.new()
			if x == path_start_x:
				path.append(Vector3(x, y, z))
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

	while num_paths < map_depth:
		var current_path = path[path.size() - 1]
		var current_x = current_path.x
		var current_z = current_path.z
		var direction = Vector2(0, 0)

		if current_z == 0:
			direction = Vector2(1, 0)
		elif current_z == map_depth - 1:
			direction = Vector2(-1, 0)
		else:
			direction = Vector2(randi_range(-1, 1), 0)

		var next_x = current_x + direction.x
		var next_z = current_z + direction.y

		if next_x < 0 or next_x >= map_width or next_z < 0 or next_z >= map_depth or visited[next_x * map_depth + next_z]:
			continue

		visited[next_x * map_depth + next_z] = true

		var next_path = Vector3(next_x, y, next_z)
		path.append(next_path)
		num_paths += 1

		var path_segment = BoxMesh.new()
		var path_tile_instance = MeshInstance3D.new()
		path_tile_instance.mesh = path_segment
		path_segment.surface_set_material(0, path_material)

		path_tile_instance.transform = Transform3D.IDENTITY.translated((current_path + next_path) / 2.0 + Vector3(0.0, tile_size / 2.0, 0.0))
		add_child(path_tile_instance)
