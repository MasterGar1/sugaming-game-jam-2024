extends Node2D

var is_completed : bool = false
var unlockable_door : Node

func complete():
	unlockable_door.unlock()
