extends Node2D

#@onready var area = $Area
# Called when the node enters the scene tree for the first time.


func unlock():
	$Sprite2D/AnimationPlayer.play("door_slide")
