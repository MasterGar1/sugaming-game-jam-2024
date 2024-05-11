extends RigidBody2D

@export var FRICTION : int =  0.5

func _physics_process(delta):
	angular_velocity = 0
	rotation = 0
	linear_velocity *= FRICTION * delta
