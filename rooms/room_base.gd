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
	is_completed = true
	unlockable_door.unlock(0)
	
func transition_to(what):
	if what == -1:
		SceneManager.toggle_pause()
		var game_over_screen : PackedScene = load("res://ui/victory_screen.tscn")
		get_tree().get_current_scene().add_child(game_over_screen.instantiate())
	
	is_current = false
	camera.enabled = false
	
	if room_id == what:
		is_current = true
		camera.enabled = true
