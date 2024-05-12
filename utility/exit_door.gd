extends "res://utility/interaction_area.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	SceneManager.connect("completed", open_escape)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open_escape(index):
	pass
