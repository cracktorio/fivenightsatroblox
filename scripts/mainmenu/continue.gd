extends Button
func _ready():
	var button = self;
	button.pressed.connect(self._button_pressed)

func _button_pressed():
	print("changing scene")
	get_tree().change_scene_to_file("res://night.tscn")
