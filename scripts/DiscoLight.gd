extends OmniLight3D
var randOffset = randf_range(0,4000)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	light_color = Color.from_hsv(Time.get_ticks_msec()/(4000.0+randOffset) + randOffset,1,1)
