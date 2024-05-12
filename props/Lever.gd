extends "res://props/interactable_base.gd"

@onready var sprite=$Sprite2D
static var levs=[false, false, false]
@export var id:int=0
var on=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if levs[id-1]==true:
		pass
	if area.can_see_entity() and Input.is_action_just_pressed("interact"):
		sprite.texture=ResourceLoader.load("res://textures/on_red_lever.png")
		if id==1:
			levs[0]=true
		elif id==2 and levs[0]==true:
			levs[1]=true
		elif id==3 and levs[1]==true:
			levs[2]=true
		else:
			levs[0]=false
			levs[1]=false
			levs[2]=false
			sprite.texture=ResourceLoader.load("res://textures/red_lever.png")
			area.entity.get_hit()
		if levs[0]==true and levs[1]==true and levs[2]==true:
			#open door
			pass
