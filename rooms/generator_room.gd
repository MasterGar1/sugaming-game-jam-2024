extends "res://rooms/room_base.gd"

var rng = RandomNumberGenerator.new()
var integral_index : int

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	integral_index = rng.randi_range(1, 7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
