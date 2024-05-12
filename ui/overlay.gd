extends CanvasLayer

@onready var timer_label = $TimerLabel

func _ready():
	timer_label.hide()
	get_tree().get_current_scene().find_child("Player").connect("take_damage", change_hp)
	SceneManager.connect("timer_start", start_timer_ui)

func _process(delta):
	if timer_label.visible:
		timer_label.text = str(get_tree().get_current_scene().find_child("EndTimer", true, false).time_left)

func change_hp(left : int):
	match left:
		2:
			$HBox/HP3/TextureRect.hide()
		1:
			$HBox/HP2/TextureRect.hide()
		0:
			$HBox/HP1/TextureRect.hide()

func start_timer_ui():
	timer_label.show()
