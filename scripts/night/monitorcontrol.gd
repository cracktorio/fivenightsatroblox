extends Node

var camSELF
var monitor = false
var lastcamera
var vhsfilter
var mapbuttons
var map
var movecamleft
var movecamright
var powerdisplay
var monitortoggle
var firstframe
var countdowntimer

signal open_monitor
signal close_monitor

var cam1A
var cam1B
var cam1C
var cam2A
var cam2B
var cam3
var cam4A
var cam4B
var cam5
var cam6
var cam7


func _ready():
	camSELF  = get_node("/root/Node3D/restaurant/office/CamSELF")
	lastcamera = get_node("/root/Node3D/restaurant/dining area/Cam1A")
	vhsfilter = get_node("/root/Node3D/CanvasLayer/vhs shader")
	mapbuttons = get_node("/root/Node3D/CanvasLayer/map buttons")
	map = get_node("/root/Node3D/CanvasLayer/map")
	movecamleft = get_node("/root/Node3D/CanvasLayer/movecamleft")
	movecamright = get_node("/root/Node3D/CanvasLayer/movecamright")
	powerdisplay = get_node("/root/Node3D/CanvasLayer/powerdisplay")
	monitortoggle = get_node("/root/Node3D/CanvasLayer/monitor toggle")
	countdowntimer = get_node("countdown monitor")
	
	cam1A = get_node("/root/Node3D/restaurant/dining area/Cam1A")
	cam1B = get_node("/root/Node3D/restaurant/dining area/Cam1B")
	cam1C = get_node("/root/Node3D/restaurant/dining area/Cam1C")
	cam2A = get_node("/root/Node3D/restaurant/hallway left/Cam2A")
	cam2B = get_node("/root/Node3D/restaurant/hallway left/Cam2B")
	cam3 = get_node("/root/Node3D/restaurant/supply closet/Cam3")
	cam4A = get_node("/root/Node3D/restaurant/hallway right/Cam4A")
	cam4B = get_node("/root/Node3D/restaurant/hallway right/Cam4B")
	cam5 = get_node("/root/Node3D/restaurant/backstage/Cam5")
	cam6 = get_node("/root/Node3D/restaurant/Cam6")
	cam7 = get_node("/root/Node3D/restaurant/restroom/Cam7")

func _process(delta):
	match true:
		cam1A.current: lastcamera = get_node("/root/Node3D/restaurant/dining area/Cam1A")
		cam1B.current: lastcamera = get_node("/root/Node3D/restaurant/dining area/Cam1B")
		cam1C.current: lastcamera = get_node("/root/Node3D/restaurant/dining area/Cam1C")
		cam2A.current: lastcamera = get_node("/root/Node3D/restaurant/hallway left/Cam2A")
		cam2B.current: lastcamera = get_node("/root/Node3D/restaurant/hallway left/Cam2B")
		cam3.current: lastcamera = get_node("/root/Node3D/restaurant/supply closet/Cam3")
		cam4A.current: lastcamera = get_node("/root/Node3D/restaurant/hallway right/Cam4A")
		cam4B.current: lastcamera = get_node("/root/Node3D/restaurant/hallway right/Cam4B")
		cam5.current: lastcamera = get_node("/root/Node3D/restaurant/backstage/Cam5")
		cam6.current: lastcamera = get_node("/root/Node3D/restaurant/Cam6")
		cam7.current: lastcamera = get_node("/root/Node3D/restaurant/restroom/Cam7")
	
	if(monitor):
		if(firstframe):
			firstframe = false
			emit_signal("open_monitor")
			countdowntimer.start(0.5)
			#hiding of objects happens in the countdown function

	else:
		if(firstframe):
			firstframe = false
			emit_signal("close_monitor")
		vhsfilter.hide()
		map.hide()
		mapbuttons.hide()
		powerdisplay.hide()
		movecamleft.show()
		movecamright.show()
		camSELF.current = true

func _on_monitor_toggle_button_down():
	monitor = !monitor
	firstframe = true

func _on_countdown_monitor():
	vhsfilter.show()
	map.show()
	mapbuttons.show()
	powerdisplay.show()
	movecamleft.hide()
	movecamright.hide()
	countdowntimer.stop()
	lastcamera.current = true

func _force_monitor_down():
	if(monitor):
		monitor = false
		firstframe = true
