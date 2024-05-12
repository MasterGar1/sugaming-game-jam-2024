extends "res://props/interactable_base.gd"

@export var text : String

func _process(delta):
	if area.can_see_entity() and Input.is_action_just_pressed("interact"):
		var inst = interface.instantiate()
		get_tree().get_current_scene().add_child(interface.instantiate())
