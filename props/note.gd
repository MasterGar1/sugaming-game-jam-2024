extends "res://props/interactable_base.gd"

@export var text : String

func _process(delta):
	if area.can_see_entity() and Input.is_action_just_pressed("interact"):
		var inst = interface.instantiate()
		get_tree().get_current_scene().add_child(inst)
		inst.init(text)
		if get_tree().get_current_scene().find_child("Start").is_current == true:
			get_tree().get_current_scene().find_child("Start").complete(0)
