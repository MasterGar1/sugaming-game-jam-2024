extends CanvasLayer

func _close():
	SceneManager.toggle_pause()
	self.queue_free()
