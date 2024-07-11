extends Button
func _ready():
	var button = self;
	button.pressed.connect(self._button_pressed)

func _button_pressed():
	print("setting savefile to night 1")
	#TODO
	#change save file to night 1
	print ("Loading night scene")
	get_tree().change_scene_to_file("res://night.tscn")
