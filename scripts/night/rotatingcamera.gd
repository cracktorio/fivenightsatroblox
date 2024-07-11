extends Camera3D

var camera = self
var time2 = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.rotate_y(sin(time2*0.25)*0.002)
	time2 = time2 + delta
