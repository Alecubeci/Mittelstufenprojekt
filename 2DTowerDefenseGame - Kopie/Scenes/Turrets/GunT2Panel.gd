extends Panel

@onready var tower = preload("res://Scenes/Turrets/MissileT1.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		
		
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		
		get_child(1).global_position = event.global_position
		var mapPath = get_tree().get_root().get_node("GameScene/Map1/EverythingElse")
		var tile = mapPath.local_to_map(get_global_mouse_position())
		currTile = mapPath.get_cell_atlas_coords(0 , tile, false)
		var inGroup = get_tree().get_nodes_in_group("STREET")
		
		if currTile == Vector2i(0,0) or currTile == Vector2i(1, 0) or currTile == Vector2i(2, 0) or currTile == Vector2i(3, 1) or currTile == Vector2i(4, 1) or currTile == Vector2i(5, 1) or currTile == Vector2i(6, 1):
			get_child(1).get_node("Area").modulate = Color(255,255,255)
		else:
			get_child(1).get_node("Area").modulate = Color(0,255,0)
	
		
	elif event is InputEventMouseButton and event.button_mask == 0:
		if event.global_position.x >= 1150 and event.global_position.y >= 500:
			if get_child_count() > 1:
				get_child(1).queue_free()
		else: 
			if get_child_count() > 1:
				get_child(1).queue_free()
			if currTile == Vector2i(0,0) or currTile == Vector2i(1, 0) or currTile == Vector2i(2, 0) or currTile == Vector2i(3, 1) or currTile == Vector2i(4, 1) or currTile == Vector2i(5, 1) or currTile == Vector2i(6, 1):
				get_child(1).queue_free()
			else:
				var path = get_tree().get_root().get_node("GameScene")
		
				path.add_child(tempTower)
				tempTower.global_position = event.global_position
				tempTower.get_node("Area").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()



