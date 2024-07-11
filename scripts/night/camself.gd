extends Camera3D

var rotateleft = false
var rotateright = false

func _on_movecamleft_mouse_entered():
	rotateleft = true
func _on_movecamleft_mouse_exited():
	rotateleft = false
func _on_movecamright_mouse_entered():
	rotateright = true
func _on_movecamright_mouse_exited():
	rotateright = false

func _process(delta):
	if(self.current):
		if(rotateleft):
			rotation.y = rotation.y + 0.02
		
		if(rotateright):
			rotation.y = rotation.y - 0.02
	
	if(rotation.y >deg_to_rad(130)):
		rotation.y = deg_to_rad(130)
	
	if(rotation.y < deg_to_rad(60)):
		rotation.y = deg_to_rad(60)


func _on_close_monitor():
	pass # Replace with function body.
