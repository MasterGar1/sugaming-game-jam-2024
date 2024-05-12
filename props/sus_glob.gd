extends "res://props/interactable_base.gd"


func _process(delta):
	if area.can_see_entity() and Input.is_action_just_pressed("interact"):
		if get_tree().get_current_scene().find_child("Light").is_current == true:
			get_tree().get_current_scene().find_child("Light").complete(2)
