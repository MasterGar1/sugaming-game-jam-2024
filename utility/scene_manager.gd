extends Node

func toggle_pause():
	get_tree().paused = not get_tree().paused
