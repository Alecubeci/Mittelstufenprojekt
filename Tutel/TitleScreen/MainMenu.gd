extends Control

@export var MainGameScene : PackedScene

func _on_new_game_button_pressed():
	get_tree().change_scene_to_file(MainGameScene.resource_path)


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Options/OptionMenu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
