extends Node2D

@export var MainGameScene : PackedScene
#@export var OptionsScene : PackedScene

func _on_new_game_button_button_up():
	get_tree().change_scene_to_file(MainGameScene.resource_path)


#func _on_options_button_button_up():
#	get_tree().change_scene_to_file()
