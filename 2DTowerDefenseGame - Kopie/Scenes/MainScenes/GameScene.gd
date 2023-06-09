extends Node2D

@onready var path = preload("res://Scenes/Enemies/stage1.tscn")

var wave = 0
var mobs_left = 0
var wave_mobs = [5,10, 15]

func _ready():
	$wavetimer.start()

func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)



func _on_wavetimer_timeout():
	mobs_left = wave_mobs[wave]
	$spwantimer.start()


func _on_spwantimer_timeout():
		pass 

