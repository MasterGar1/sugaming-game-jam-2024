extends Node2D

@export var room_id : int
var is_completed : bool = false
@export var unlockable_door : Node
@onready var camera = $Camera2D
@export var is_current : bool = false

func _ready():
	camera.enabled = is_current
	SceneManager.connect("completed", complete)
	SceneManager.connect("switch_room", transition_to)

func complete(index):
	if index == room_id:
		is_completed = true
		unlockable_door.unlock(index)
	
func transition_to(what):
	is_current = false
	camera.enabled = false
	
	if room_id == what:
		is_current = true
		camera.enabled = true
