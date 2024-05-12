extends Node

var boolHasUnlocked : bool = false

signal completed(index)
signal switch_room(to_what)
signal timer_start()
@onready var timer = preload("res://utility/end_timer.tscn")

func toggle_pause():
	get_tree().paused = not get_tree().paused

func begin_end():
	var t = timer.instantiate()
	get_tree().get_current_scene().add_child(t)
	var player = get_tree().get_current_scene().find_child("Player")
	t.connect("timeout", player.game_over)
	timer_start.emit()
