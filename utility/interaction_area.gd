extends Area2D

var is_seen : bool = false
var entity = null

func can_see_entity():
	return is_seen

func _on_body_entered(body):
	is_seen = true
	entity = body

func _on_body_exited(body):
	is_seen = false
	entity = null
