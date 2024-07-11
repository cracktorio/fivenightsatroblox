extends Node3D

var mouse_entered = false
var toggle

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (mouse_entered && Input.is_action_just_pressed("mouseleftpressed")):
		toggle = !toggle

	if (toggle):
		self.show()
	else:
		self.hide()

func _on_buttonleftlamp_mouse_entered():
	mouse_entered = true
func _on_buttonleftlamp_mouse_exited():
	mouse_entered = false
func _on_buttonrightlamp_mouse_entered():
	mouse_entered = true
func _on_buttonrightlamp_mouse_exited():
	mouse_entered = false
