extends Label

func _process(delta):
	self.text = "Gold: " + str(Game.gold)
