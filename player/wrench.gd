extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var collider = $CollisionShape2D
@onready var timer = $ReloadTimer

var sees_enemy : bool = false
var enemy = null

func _on_body_entered(body):
	var hold_pos = body.find_child("HoldPosition")
	
	if hold_pos != null && hold_pos.get_children().size() == 0 && body is CharacterBody2D:
		call_deferred("get_picked_up", hold_pos)

func get_picked_up(body) :
	reparent(body)
	position = Vector2.ZERO
	collider.disabled = true
	
func swing():
	if (!timer.is_stopped()):
		return
	
	timer.start()
	collider.disabled = false
	
	if scale.x == -1:
		animation_player.play("swing_flipped")
	else:
		animation_player.play("swing")
		

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	sees_enemy = true
	enemy = body


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	sees_enemy = false
	enemy = null


func _on_animation_player_animation_finished(anim_name):
	collider.disabled = true
	get_parent().get_parent().switch_state(3)
