extends "res://ui/canvas_base.gd"

@export var answers : Dictionary
@onready var problemImg = $Problem

var integral_index : int

signal integral_fail()

# Called when the node enters the scene tree for the first time.
func _ready():
	integral_index = get_tree().get_current_scene().find_child("Generator").integral_index
	problemImg.texture = load("res://textures/Integrals/%s.png" % integral_index)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_answer(answer):
	if (answers[integral_index] == answer):
		if get_tree().get_current_scene().find_child("Generator").is_current == true:
			get_tree().get_current_scene().find_child("Generator").complete(3)
	else:
		print("Incorrect!")
		integral_fail.emit()
		
	_close()

func _on_button_0_button_up():
	check_answer(0)

func _on_button_1_button_up():
	check_answer(1)

func _on_button_2_button_up():
	check_answer(2)

func _on_button_3_button_up():
	check_answer(3)

func _on_button_4_button_up():
	check_answer(4)

func _on_button_5_button_up():
	check_answer(5)

func _on_button_6_button_up():
	check_answer(6)

func _on_button_7_button_up():
	check_answer(7)

func _on_button_8_button_up():
	check_answer(8)

func _on_button_9_button_up():
	check_answer(9)
