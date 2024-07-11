extends Node3D

var movechance = 0.0
var state = 0
var randfloat
var state3timer
var curtain_closed
var curtain_open
var foxy_incurtain
var foxy_walkingaway
var foxy_jump
var sound_running
var sound_jump
var sound_door_banging
var cam1C
var cam2A
var leftdoordown = false
signal monitordown
var foxy_running_animation
var jump_animation
var debug_text

func _ready():
	cam1C = get_node("/root/Node3D/restaurant/dining area/Cam1C")
	cam2A = get_node("/root/Node3D/restaurant/hallway left/Cam2A")
	state3timer = get_node("state3timer")
	jump_animation = get_node("foxy jumpscare anim")
	foxy_running_animation = get_node("foxy running anim")

	curtain_closed = get_node("/root/Node3D/restaurant/piratecove/curtain_closed")
	curtain_open = get_node("/root/Node3D/restaurant/piratecove/curtain_open")
	foxy_incurtain = get_node("foxy_incurtain")
	foxy_walkingaway = get_node("foxy_walkingaway")
	foxy_jump = get_node("foxy_jump")
	
	sound_running = get_node("sound_running")
	sound_jump = get_node("sound_jump")
	sound_door_banging = get_node("sound_door_banging")
	debug_text = get_node("/root/Node3D/CanvasLayer/debugtext/foxy")


func _on_doorleft_door_closed():
	leftdoordown = true

func _on_doorleft_door_opened():
	leftdoordown = false

func _on_movementcooldown_timeout():
	randfloat = randf_range(5.0, 50.0)

	if(movechance > randfloat):
		print(self.name + " moved, state: " + var_to_str(state))
		state += 1
	else:
		print(self.name + " NOT moved, state: " + var_to_str(state))

	match state: #WAY TOO LONG
		0:
			curtain_closed.show()
			curtain_open.hide()
			foxy_incurtain.hide()
			foxy_walkingaway.hide()
		1:
			curtain_closed.hide()
			curtain_open.show()
			foxy_incurtain.show()
			foxy_walkingaway.hide()
		2:
			curtain_closed.hide()
			curtain_open.show()
			foxy_incurtain.hide()
			foxy_walkingaway.show()
		3: #actual jumpscare handled later
			curtain_closed.hide()
			curtain_open.show()
			foxy_incurtain.hide()
			foxy_walkingaway.hide()


func _process(delta):
	if(cam1C.current):
		movechance = 0.0
	else:
		movechance += delta

	if (cam2A.current && state > 2):
		foxy_jump.show()
		foxy_running_animation.play("foxy running")
		state3timer.start(3.0)
		sound_running.play()
		state = 0


	debug_text.clear()
	debug_text.set_text("")
	debug_text.add_text("FOXY DEBUG")
	debug_text.newline()
	debug_text.add_text("movement chance: " + var_to_str(movechance) + ">" + var_to_str(randfloat))
	debug_text.newline()
	debug_text.add_text("state: " + var_to_str(state))
	debug_text.newline()
	

func _on_state_3_timer_timeout():
	if(leftdoordown):
		sound_door_banging.play()
		foxy_jump.hide()
		print("player was too fast for foxy")
	else:
		emit_signal("monitordown")
		foxy_jump.show()
		jump_animation.play("foxy jumpscare")
		sound_jump.play()
		print("player got jumpscared by foxy")


func _on_button_increasestate_pressed():
	state += 1

func _on_sound_jump_finished():
	get_tree().quit(666)
