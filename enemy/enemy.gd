extends CharacterBody2D

@onready var area = $Area
@onready var attack_rot = $AttackRotation

const JUPM_STRENGTH = 50
const GRAVITY = 3

enum {
	IDLE, ATTACK
}

var state : int = IDLE

func _physics_process(delta):
	if area.can_see_entity() and state == IDLE:
		state = ATTACK
		attack_rot.get_child(0).position.x = area.entity.position.distance_to(position)
		
		var direction = global_position.direction_to(area.entity.global_position)
		
		attack_rot.rotation = direction.angle()
		if direction.angle() <= PI / 2 and direction.angle() >= -PI/2:  
			velocity = direction.rotated(-PI/4) * JUPM_STRENGTH
		else:
			velocity = direction.rotated(PI/4) * JUPM_STRENGTH
			
	if velocity == Vector2.ZERO:
		state = IDLE
			
	velocity = velocity * delta * GRAVITY
	move_and_collide(velocity)
