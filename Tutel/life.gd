extends Node

var life = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func reduce_life():
	life -=1
	print(life)
	if life <= 0:
		print("Game Over")
