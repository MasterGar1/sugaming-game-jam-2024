extends "res://props/interactable_base.gd"

@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if area.can_see_entity() and Input.is_action_just_pressed("interact"):
		SceneManager.completed.emit(-1)
