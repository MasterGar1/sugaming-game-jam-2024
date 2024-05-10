extends CharacterBody2D

@export var SPEED : int = 300

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

var state : int = MOVE

#States
enum {
	MOVE, ATTACK, IDLE
}

func _process(delta):
	#This will manage animations
	pass

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
	move_and_collide(velocity)
