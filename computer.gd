extends "res://props/interactable_base.gd"

@onready var animation=$AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation.play("input")
	
	
