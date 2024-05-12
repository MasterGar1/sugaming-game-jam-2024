extends Control

@export var path = "res://rooms/world.tscn"

func _on_button_button_up():
	get_tree().change_scene_to_file(path)
