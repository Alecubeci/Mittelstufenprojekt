extends Control

var is_paused = false:
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused

func _unhandled_input(event):
	if event.is_action_pressed("esc"):
		self.is_paused = !is_paused

func _on_continue_button_pressed():
	self.is_paused = false

func _on_options_button_pressed():
	self.visible = false
	
func _on_quit_button_pressed():
	self.is_paused = !is_paused
	get_tree().change_scene_to_file("res://Game/TitleScreen/MainMenu.tscn")
