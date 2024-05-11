extends StaticBody2D

@onready var enemy = $Path2D/PathFollow2D/Enemy
@onready var animation_player = $AnimationPlayer
@onready var path = $Path2D
@onready var area = $Area

var player = null

func _process(delta):
	if enemy != null:
		if area.can_see_entity() and enemy.state == enemy.IDLE:
			player = area.entity
			$CollisionShape2D.disabled = true
			enemy.state = enemy.ATTACK
			animation_player.play("attack")
			enemy.sprite.play("attack")

func rotate_attack():
	path.look_at(area.entity.position)
	if path.rotation <= -PI/2 or path.rotation >= PI/2:
		path.scale = Vector2(1, -1)

func _animation_finished(anim_name):
	if anim_name == "attack":
		player = null
		$CollisionShape2D.disabled = false
		if enemy != null:
			enemy.state = enemy.STATIC

func _on_enemy_player_hit():
	player.getHit()
	enemy.queue_free()
