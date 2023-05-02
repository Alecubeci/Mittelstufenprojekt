extends Node3D

#@onready var player = Player.new()
func _physics_process(delta):
	turn()
	

func turn():
	#var enemyPos = player
	#$Barrel.look_at($"../MeshInstance3D".global_transform.origin, Vector3.UP)
	
