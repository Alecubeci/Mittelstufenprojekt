extends Node2D

var map_node

var build_mode = false
var build_valid = false
var build_location
var build_type

func _ready():
	pass


func _process(delta):
	pass

func _unhandled_input(event):
	pass

func initiate_build_mode(tower_type):
	pass

#func update_tower_preview():
#	var mouse_position = get_global_mouse_position()
#	var current_tile = map_node.get_node("EverythingElse").world_to_map(mouse_position)
#	var tile_position = map_node.get_node("EverythingElse").map_to_world(current_tile)
#
#	if map_node.get_node("EverythingElse").get_cellv(current_tile) == -1:
#		get_node("UI").update_tower_preview(tile_position, "ad54ff3c")
#
#	else:
#		get_node("UI").update_tower_preview(tile_position, "adff4545")
#

func cancel_build_mode():
	pass

func verify_and_build():
	pass
