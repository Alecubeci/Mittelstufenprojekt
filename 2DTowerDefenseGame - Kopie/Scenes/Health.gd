extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Health: " + str(Game.health)
