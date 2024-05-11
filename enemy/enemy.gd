extends CharacterBody2D

@onready var area = $Area
@onready var animation_player = $AnimationPlayer

const JUPM_STRENGTH = 50
const GRAVITY = 3

enum {
	IDLE, ATTACK, STATIC
}

var state : int = IDLE

func _process(delta):
	if area.can_see_entity() and state == IDLE:
		state = ATTACK
		animation_player.play("attack")
			
	if velocity == Vector2.ZERO:
		state = IDLE


func _on_animation_finished(anim_name):
	if anim_name == "attack":
		pass
