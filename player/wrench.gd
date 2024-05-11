extends Area2D

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
		print("Picked up!")

func get_picked_up(body) :
	reparent(body)
	position = Vector2.ZERO
