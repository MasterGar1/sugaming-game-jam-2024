extends Node

var boolHasUnlocked : bool = false

func toggle_pause():
	get_tree().paused = not get_tree().paused
