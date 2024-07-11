extends Node3D

var movechance = 10
var walk_sfx

func _on_movementcooldown_timeout():
	var randint = randi_range(0, 20)
	if(movechance > randint):
		print(self.name + " has moved")
	else:
		print(self.name + " has NOT moved")
