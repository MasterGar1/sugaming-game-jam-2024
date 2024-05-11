extends StaticBody2D

@onready var enemy = $Path2D/PathFollow2D/Enemy
@onready var animation_player = $AnimationPlayer
@onready var path = $Path2D
@onready var area = $Area

func _process(delta):
	if area.can_see_entity() and enemy.state == enemy.IDLE:
		enemy.state = enemy.ATTACK
		animation_player.play("attack")

func rotate_attack():
	path.look_at(area.entity.position)
	if path.rotation <= -PI/2 or path.rotation >= PI/2:
		path.scale = Vector2(1, -1)
