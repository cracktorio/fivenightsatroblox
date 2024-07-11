extends AudioStreamPlayer3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!self.playing):
		self.play()
