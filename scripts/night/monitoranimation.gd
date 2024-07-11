extends AnimationPlayer

func _on_open_monitor():
	self.play("monitor")


func _on_close_monitor():
	self.play_backwards("monitor")
