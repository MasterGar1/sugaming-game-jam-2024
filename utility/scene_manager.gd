extends Node

var boolHasUnlocked : bool = false

signal completed(index)
signal switch_room(to_what)

func toggle_pause():
	get_tree().paused = not get_tree().paused
