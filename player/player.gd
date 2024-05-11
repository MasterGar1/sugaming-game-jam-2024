extends CharacterBody2D

@export var SPEED : int = 300
@export_range(0, 10) var health : int = 3

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

@onready var sprite = $Sprite2D

var state : int = MOVE

signal death()

#States
enum {
	MOVE, ATTACK, IDLE
}

func _physics_process(delta):
	#State machine & Control logic
	match state:
		IDLE:
			pass
		MOVE:
			move(delta)
			
		ATTACK:
			pass
	
#Movement
func move(delta):
	var input_direction : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED * delta
	
	var hold_pos = find_child("HoldPosition")
	if hold_pos != null && input_direction != Vector2.ZERO:
		var offset = Vector2(0, -20)
		hold_pos.look_at(position)
		hold_pos.set_position(input_direction.normalized() * 40)
	
	move_and_collide(velocity)
	
func getHit():
	health -= 1
	
	if (health <= 0):
		death.emit()
