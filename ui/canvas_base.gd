extends CanvasLayer

func _close():
	self.queue_free()
