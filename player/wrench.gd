extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	
	var hold_pos = body.find_child("HoldPosition")
	
	if hold_pos != null && hold_pos.get_children().size() == 0 && body is CharacterBody2D:
		call_deferred("get_picked_up", hold_pos)

func get_picked_up(body) :
	reparent(body)
	position = Vector2.ZERO
	
func swing():
	if sprite.flip_h:
		animation_player.play("swing_flipped")
	else:
		animation_player.play("swing")
