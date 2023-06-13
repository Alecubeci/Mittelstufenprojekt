extends Control

func _unhandled_input(event):
	if event.is_action_pressed("esc"):
		self.visible = false

#func _on_options_button_pressed():
	#self.visible = true


func _on_back_button_pressed():
	self.visible = false
