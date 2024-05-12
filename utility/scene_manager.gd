extends Node

var boolHasUnlocked : bool = false

signal completed(index)

func toggle_pause():
	get_tree().paused = not get_tree().paused

func switch_room():
	pass
