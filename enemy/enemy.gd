extends CharacterBody2D

@onready var sprite = $Sprite2D

enum {
	IDLE, ATTACK, STATIC
}

var state : int = IDLE

signal player_hit()

func _process(delta):
	if state == ATTACK:
		var col = move_and_collide(velocity)
		if col != null:
			player_hit.emit()
