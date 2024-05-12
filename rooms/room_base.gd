extends Node2D

@export var room_id : int
var is_completed : bool = false
@export var unlockable_door : Node
@onready var camera = $Camera2D
@export var is_current : bool = false

func _ready():
	camera.enabled = is_current

func complete():
	unlockable_door.unlock()
