extends Node2D

@export var transition : int = 0
@onready var area = $Area
@onready var sprite = $Sprite2D

func _ready():
	SceneManager.connect("completed", unlock)

func _process(delta):
	if area.can_see_entity():
		SceneManager.switch_room.emit(transition)

func unlock():
	$Area/CollisionShape2D.disabled = false
	$CollisionShape2D.disabled = true
	sprite.play("default")
	await sprite.animation_finished
	sprite.visible = false
