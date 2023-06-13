extends Control

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://TitleScreen/MainMenu.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("esc"):
		get_tree().change_scene_to_file("res://TitleScreen/MainMenu.tscn")
