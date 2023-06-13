extends Node2D

@onready var path = preload("res://Scenes/Enemies/stage1.tscn")
var i = 0
func _on_timer_timeout():
	if i < 15:
		var tempPath = Game.enemy_path.instantiate()
		add_child(tempPath)
		i+=1


