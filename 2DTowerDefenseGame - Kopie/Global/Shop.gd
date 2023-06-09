extends Panel

@onready var gunT1 = preload("res://Scenes/Turrets/Tower+Bullets/GunT1.tscn") 
@onready var missleT1 = preload("res://Scenes/Turrets/Tower+Bullets/MissileT1.tscn")

@onready var tower 

var price 
var currTile

func detectTowerType(event):
	
	if name == "Gun":
		tower = gunT1
		price = 15
		print(name)
		
	else:
		tower = missleT1
		price = 25
		print(name)
		
	



func _on_gui_input(event):
	if Game.gold >= 15:
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
			
			var targets = get_child(1).get_node("TowerDetector").get_overlapping_bodies()
			
			
			if currTile == Vector2i(0,0) or currTile == Vector2i(1, 0) or currTile == Vector2i(2, 0) or currTile == Vector2i(3, 1) or currTile == Vector2i(4, 1) or currTile == Vector2i(5, 1) or currTile == Vector2i(6, 1):
					get_child(1).get_node("Area").modulate = Color(255,255,255)
			else:
				if targets.size() > 0:
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
#					var targets = get_child(1).get_node("TowerDetector").get_overlapping_bodies()
#					if targets.size() < 1:
					path.add_child(tempTower)
					tempTower.global_position = event.global_position
					tempTower.get_node("Area").hide()
					Game.gold -= price
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()


