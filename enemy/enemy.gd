extends CharacterBody2D

@onready var area = $Area

const JUPM_STRENGTH = 300
const FRICTION = 0.5

enum {
	IDLE, ATTACK
}

var state : int = IDLE

func _physics_process(delta):
	if area.can_see_entity() and state == IDLE:
		state = ATTACK
		var direction = global_position.direction_to(area.entity.global_position).rotated(PI / 4)
		velocity = JUPM_STRENGTH * FRICTION * direction * delta
		
	
	move_and_collide(velocity)
