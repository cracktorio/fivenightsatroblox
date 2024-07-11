extends Button

var camera
var selfname

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self;
	button.pressed.connect(self._button_pressed)

	selfname = self.get_name()
	match selfname:
		"cam1A":
			camera = get_node("/root/Node3D/restaurant/dining area/Cam1A")
		"cam1B":
			camera = get_node("/root/Node3D/restaurant/dining area/Cam1B")
		"cam1C":
			camera = get_node("/root/Node3D/restaurant/dining area/Cam1C")
		"cam2A":
			camera = get_node("/root/Node3D/restaurant/hallway left/Cam2A")
		"cam2B":
			camera = get_node("/root/Node3D/restaurant/hallway left/Cam2B")
		"cam3":
			camera = get_node("/root/Node3D/restaurant/supply closet/Cam3")
		"cam4A":
			camera = get_node("/root/Node3D/restaurant/hallway right/Cam4A")
		"cam4B":
			camera = get_node("/root/Node3D/restaurant/hallway right/Cam4B")
		"cam5":
			camera = get_node("/root/Node3D/restaurant/backstage/Cam5")
		"cam6":
			camera = get_node("/root/Node3D/restaurant/Cam6")
		"cam7":
			camera = get_node("/root/Node3D/restaurant/restroom/Cam7")
			
func _button_pressed():
	camera.current = true;
	print("switching to " + camera.to_string())
	#TODO: send camera variable to monitor control script for remembering last camera
