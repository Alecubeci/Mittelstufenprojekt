extends Node2D

@onready var path = preload("res://Scenes/Enemies/stage1.tscn")

var current_wave = 0
var mobs_left = 0
var wave_mobs = [5,10, 15]
var maps = ["res://Scenes/Maps/map_1.tscn","res://Scenes/Maps/map_2.tscn","res://Scenes/Maps/map_3.tscn","res://Scenes/Maps/map_4.tscn","res://Scenes/Maps/map_5.tscn","res://Scenes/Maps/map_6.tscn","res://Scenes/Maps/map_7.tscn","res://Scenes/Maps/map_8.tscn","res://Scenes/Maps/map_9.tscn","res://Scenes/Maps/map_10.tscn","res://Scenes/Maps/map_11.tscn","res://Scenes/Maps/map_12.tscn","res://Scenes/Maps/map_13.tscn","res://Scenes/Maps/map_14.tscn","res://Scenes/Maps/map_15.tscn"]
var map_instance = null
var enemies_in_wave = 0


	
func _ready():
	randomize()
	var map_path = maps[randi() %maps.size()]
	var map_scene = load(map_path)
	if map_scene is PackedScene:
		map_instance = map_scene.instantiate()
		self.add_child(map_instance)
		map_instance.connect("tree_ready", Callable(self, "_on_map_ready"))
	else:
		print("Fehler beim Laden der Szene: " + map_path)
	
	var tileMap = map_instance.get_node("EverythingElse")
	Game.enemy_path = map_scene
	var local_position = tileMap.to_local(get_global_mouse_position())
	var tile = tileMap.get_cell_atlas_coords(0, local_position, false)

	start_next_wave()
	$wavetimer.start()

func _on_map_ready():
	var tileMap = map_instance.get_node("EverythingElse")
#var tileMap = map_instance.get_node("EverythingElse")
	var tile = tileMap.world_to_map(get_global_mouse_position())
func get_current_map():
	return map_instance
	
func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)



func _on_wavetimer_timeout():
	#mobs_left = wave_mobs[wave]
	$spwantimer.start()

var i=0
func _on_spwantimer_timeout():
	
	#if i < 9:
		#var tempPath = Game.enemy_path.instantiate()
	#	add_child(Game.enemy_path.instantiate())
	#	i+=1 
	pass

func start_next_wave():
	var wave_data = retrieve_wave_data()
	await get_tree().create_timer(0.2).timeout
	spawn_enemies(wave_data)

func retrieve_wave_data():  
	var wave_data = [["EnemyAtscn",0.7], ["EnemyAtscn",0.2], ["EnemyAtscn", 0.2]]
	current_wave +=1
	enemies_in_wave = wave_data.size()
	return wave_data

func spawn_enemies(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Scenes/Enemies/EnemyAtscn.tscn").instantiate()  
		#map_instance.get_node("Path").add_child(new_enemy, true)  
		await get_tree().create_timer(i[1]).timeout

func death():
	if Game.health <= 0:
		print("Tod")
