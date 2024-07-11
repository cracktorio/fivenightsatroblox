extends TextureRect

var robloxian
var robloxian_flipped
var robloxian_flipped2
var robloxian_sad
var timera

# Called when the node enters the scene tree for the first time.
func _ready():
	robloxian = load("res://textures/robloxian/Robloxian.webp")
	robloxian_flipped = load("res://textures/robloxian/Robloxian_flipped.webp")
	robloxian_flipped2 = load("res://textures/robloxian/Robloxian_flipped2.webp")
	robloxian_sad = load("res://textures/robloxian/Robloxlian_sad.webp")
	timera = get_node("/root/Node2D/timera")
# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_timera_timeout():
	var randint = randi_range(1, 10)
	self.set_texture(robloxian)
	match randint:
		1:
			self.texture = robloxian_flipped
		2:
			self.texture = robloxian_flipped2
		3:
			self.texture = robloxian_sad
