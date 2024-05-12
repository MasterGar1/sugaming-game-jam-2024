extends Node2D

@export var room_id : int
var is_completed : bool = false
@export var unlockable_door : Node

func complete():
	unlockable_door.unlock()
