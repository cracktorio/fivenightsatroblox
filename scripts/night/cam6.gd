extends Node

var cam6text

func _ready():
	cam6text = get_node("/root/Node3D/CanvasLayer/cam6text")

func _process(delta):
	if(self.current):
		cam6text.show()
	else:
		cam6text.hide()
