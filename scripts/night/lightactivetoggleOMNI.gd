extends OmniLight3D

var camera
var enablelight
# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(camera.current && enablelight):
		self.show()
		print("omnilight enabled for " + camera.to_string())
		enablelight = false
	if (camera.current == false):
		self.hide()
		enablelight = true
