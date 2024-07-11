extends Node3D

var mouse_entered = false
var toggle
var animationplayer
var sound_door_close
var firstframe
signal door_opened
signal door_closed

func _ready():
	animationplayer = get_node("AnimationPlayer")
	sound_door_close = get_node("sound_door_close")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (mouse_entered && Input.is_action_just_pressed("mouseleftpressed")):
		toggle = !toggle
		firstframe = true

	if (firstframe):
		if (toggle):
			animationplayer.play(self.name + "_close")
			sound_door_close.play()
			emit_signal("door_closed")
		else:
			animationplayer.play_backwards(self.name + "_close")
			sound_door_close.play()
			emit_signal("door_opened")
		firstframe = false

func _on_buttonleftdoor_mouse_entered():
	mouse_entered = true
func _on_buttonleftdoor_mouse_exited():
	mouse_entered = false
func _on_buttonrightdoor_mouse_entered():
	mouse_entered = true
func _on_buttonrightdoor_mouse_exited():
	mouse_entered = false
