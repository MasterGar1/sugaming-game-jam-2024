extends CanvasLayer

func _ready():
	get_tree().get_current_scene().find_child("Player").connect("take_damage", change_hp)

func change_hp(left : int):
	match left:
		2:
			$HBox/HP3/TextureRect.hide()
		1:
			$HBox/HP2/TextureRect.hide()
		0:
			$HBox/HP1/TextureRect.hide()
