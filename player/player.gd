extends CharacterBody2D
class_name Player
@export var SPEED : int = 300
@export_range(0, 10) var health : int = 3

@onready var sprite = $Sprite2D
@onready var hurtbox = $Hurtbox
@onready var wrench_holder = $HoldPosition

var state : int = MOVE

var input_direction : Vector2 = Vector2.ZERO

signal death()

#States
enum {
	MOVE, ATTACK, IDLE
}

func _ready():
	sprite.play("Idle")

func _process(delta):
	if wrench_holder.get_child_count() > 0:
		if wrench_holder.get_child(0).enemy is Enemy and state == ATTACK:
			wrench_holder.get_child(0).enemy.die()

func _physics_process(delta):
	#State machine & Control logic
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	match state:
		IDLE:
			if input_direction != Vector2.ZERO:
				switch_state(MOVE)
		MOVE:
			move(delta)
			
		ATTACK:
			attack(delta)
	
func _unhandled_input(event):
	if event.is_action_pressed("attack") && has_wrench():
		state = ATTACK
		
#Movement
func move(delta):
	velocity = input_direction * SPEED * delta
	
	if input_direction == Vector2.ZERO:
		switch_state(IDLE)
		return
	
	sprite.flip_h = input_direction.x < 0 || input_direction.y > 0
	
	if has_wrench() && input_direction != Vector2.ZERO:
		var hold_pos = find_child("HoldPosition")
		var offset = Vector2(0, -40)
		var flip = false;
		
		if (input_direction.y < 0 && input_direction.x == 0):
			flip = true
			hold_pos.rotation = PI / 2
			offset = Vector2(30, -20)
		elif (input_direction.y > 0 && input_direction.x == 0):
			flip = true
			hold_pos.rotation = -PI / 2
			offset = Vector2(-30, -20)
		elif (input_direction.y > 0 && input_direction.x > 0):
			hold_pos.rotation = PI / 4
			offset = Vector2(20, -35)
		elif (input_direction.y > 0 && input_direction.x < 0):
			flip = true
			hold_pos.rotation = -PI / 4
			offset = Vector2(-20, -35)
		elif (input_direction.y < 0 && input_direction.x > 0):
			hold_pos.rotation = -PI / 4
			offset = Vector2(-15, -40)
		elif (input_direction.y < 0 && input_direction.x < 0):
			flip = true
			hold_pos.rotation = PI / 4
			offset = Vector2(15, -40)
		else:
			flip = input_direction.x < 0
			hold_pos.rotation = 0
			
		hold_pos.set_position(input_direction.normalized() * 20 + offset)
		
		
		hold_pos.find_child("Wrench", true, false).scale.x = -1 if flip else 1
	
	move_and_collide(velocity)
	
func switch_state(st : int):
	state = st
	match state:
		IDLE:
			sprite.play("Idle")
		MOVE:
			sprite.play("Move")
	
func get_hit():
	health -= 1
	print("you got hit!")
	if (health <= 0):
		death.emit()

func game_over():
	print("You died!")
	
func has_wrench() -> bool:
	return find_child("Wrench", true, false) != null

func attack(delta):
	var wrench = find_child("Wrench", true, false)
	wrench.swing()
	state = MOVE
