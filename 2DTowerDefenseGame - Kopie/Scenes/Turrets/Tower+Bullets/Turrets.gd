extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	turn()
	

func turn():
	var enemy_position = get_global_mouse_position()
	get_node("Turret").look_at(enemy_position)

