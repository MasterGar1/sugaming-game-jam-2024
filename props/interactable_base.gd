extends Node2D

@onready var area = $Area2D
@export var interface : PackedScene

func _process(delta):
	if area.can_see_player() and Input.is_action_just_pressed("interact"):
		SceneManager.toggle_pause()
		get_tree().get_current_scene().add_child(interface.instantiate())