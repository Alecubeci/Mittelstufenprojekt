extends Node

class_name Stats

@export var max_HP = 10

var current_HP = max_HP

signal enemy_died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_hit(damage):
	
	current_HP -=damage
	print("treffer", current_HP, "/", max_HP)
	
	if current_HP <=0:
		die()
		
func die():
	emit_signal("enemy_died")
