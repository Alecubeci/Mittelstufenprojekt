extends Node2D

@onready var path = preload("res://Scenes/Enemies/stage1.tscn")

var wave = 0
var mobs_left = 0
var wave_mobs = [5,10, 15]
var maps = ["res://Scenes/Maps/map_1.tscn","res://Scenes/Maps/map_2.tscn","res://Scenes/Maps/map_3.tscn","res://Scenes/Maps/map_4.tscn","res://Scenes/Maps/map_5.tscn","res://Scenes/Maps/map_6.tscn","res://Scenes/Maps/map_7.tscn","res://Scenes/Maps/map_8.tscn","res://Scenes/Maps/map_9.tscn","res://Scenes/Maps/map_10.tscn","res://Scenes/Maps/map_11.tscn","res://Scenes/Maps/map_12.tscn","res://Scenes/Maps/map_13.tscn","res://Scenes/Maps/map_14.tscn","res://Scenes/Maps/map_15.tscn"]
var map_instance = null


	
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
	var local_position = tileMap.to_local(get_global_mouse_position())
	var tile = tileMap.get_cell_atlas_coords(0, local_position, false)


	$wavetimer.start()

func _on_map_ready():
	var tileMap = map_instance.get_node("EverythingElse")
#var tileMap = map_instance.get_node("EverythingElse")
#var tile = tileMap.world_to_map(get_global_mouse_position())
func get_current_map():
	return map_instance
	
func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)



func _on_wavetimer_timeout():
	mobs_left = wave_mobs[wave]
	$spwantimer.start()


func _on_spwantimer_timeout():
		pass 

