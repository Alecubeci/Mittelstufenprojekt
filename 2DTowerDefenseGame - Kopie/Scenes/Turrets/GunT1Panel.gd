extends Panel

@onready var tower = preload("res://Scenes/Turrets/GunT1.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		
		
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		
		get_child(1).global_position = event.global_position
		
	elif event is InputEventMouseButton and event.button_mask == 0:
		get_child(1).queue_free()
		var path = get_tree().get_root().get_node("GameScene")
		
		path.add_child(tempTower)
		tempTower.global_position = event.global_position
	

