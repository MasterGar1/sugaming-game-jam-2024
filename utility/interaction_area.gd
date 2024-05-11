extends Area2D

var is_seen : bool = false
var player = null

func can_see_player():
	return is_seen

func _on_body_entered(body):
	is_seen = true
	player = body
	print(player)

func _on_body_exited(body):
	is_seen = false
	player = null
	print(player)
