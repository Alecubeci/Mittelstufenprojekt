extends Panel


var price 
var currTile

#func detectTowerType(event):




func _on_gui_input(event):
#	detectTowerType(event)
	if event.global_position.x > 1175 and event.global_position.y > 612:
		Game.tower = Game.missleT1
		price = 25
	elif event.global_position.x > 1175 and event.global_position.y > 500 :
		Game.tower = Game.gunT1
		price = 15
	if Game.gold >= price:
		var tempTower = Game.tower.instantiate()
		if event is InputEventMouseButton and event.button_mask == 1:
	
			add_child(tempTower)
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED
			print(tempTower)
			
		elif event is InputEventMouseMotion and event.button_mask == 1:
			
			get_child(1).global_position = event.global_position
			var game_scene = get_tree().get_root().get_node("GameScene")
			var tileMap = game_scene.get_current_map().get_node("EverythingElse")
			var tile = tileMap.local_to_map(get_global_mouse_position())
			currTile = tileMap.get_cell_atlas_coords(0 , tile, false)
			
			var targets = get_child(1).get_node("TowerDetector").get_overlapping_bodies()
			
			
			#if currTile == Vector2i(0,0) or currTile == Vector2i(1, 0) or currTile == Vector2i(2, 0) or currTile == Vector2i(3, 1) or currTile == Vector2i(4, 1) or currTile == Vector2i(5, 1) or currTile == Vector2i(6, 1):
			#		get_child(1).get_node("Area").modulate = Color(255,255,255)
			#else:
				#if targets.size() > 0:
				#	get_child(1).get_node("Area").modulate = Color(255,255,255)
				#else:
					#get_child(1).get_node("Area").modulate = Color(0,255,0)
				
		
			
		elif event is InputEventMouseButton and event.button_mask == 0:
			if event.global_position.x >= 1150 and event.global_position.y >= 500:
				if get_child_count() > 1:
					get_child(1).queue_free()
			else: 
				if get_child_count() > 1:
					get_child(1).queue_free()
				#if currTile == Vector2i(0,0) or currTile == Vector2i(1, 0) or currTile == Vector2i(2, 0) or currTile == Vector2i(3, 1) or currTile == Vector2i(4, 1) or currTile == Vector2i(5, 1) or currTile == Vector2i(6, 1):
				#	get_child(1).queue_free()
				#else:
					var path = get_tree().get_root().get_node("GameScene")
					var targets = get_child(1).get_node("TowerDetector").get_overlapping_bodies()
					if targets.size() < 1:
						path.add_child(tempTower)
						print(tempTower)
						tempTower.global_position = event.global_position
						tempTower.get_node("Area").hide()
						Game.gold -= price
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()


