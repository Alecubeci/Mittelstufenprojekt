extends Node2D

@onready var path = preload("res://Scenes/Enemies/stage1.tscn")

func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)
	
