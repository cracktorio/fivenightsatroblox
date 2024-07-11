extends Camera3D

var lamp
var flickercountdown
var timerdone = true

func _ready():
	lamp = get_child(0)
	flickercountdown = get_node("flicker_timer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var randint = randi_range(0, 10)
	if (timerdone):
		if(randint > 6):
			lamp.show()
		else:
			lamp.hide()
		flickercountdown.start(0.1)
		timerdone = false


func _on_flicker_timer_timeout():
	timerdone = true

