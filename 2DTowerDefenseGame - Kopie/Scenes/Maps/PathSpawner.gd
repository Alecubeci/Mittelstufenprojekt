extends Node2D

@onready var path = preload("res://Scenes/Enemies/stage1.tscn")
var i = 0
var x = 0
func _on_timer_timeout():
	if i < 9:
		var tempPath = Game.enemy_path.instantiate()
		add_child(tempPath)
		i+=1
		x+=1
	if x > 8 :
		x+=1
		if x > 30 and x < 50:
			var tempPath = Game.enemy_path.instantiate()
			add_child(tempPath)
		
		
	


