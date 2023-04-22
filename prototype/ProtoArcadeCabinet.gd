extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var ms_timer = 0
var tick_timer = 0

func _process(delta):
	ms_timer += delta
	if (ms_timer < 1):
		return
	ms_timer = 0
	
	# only run this code once a second
	print("tick")
	tick_timer += 1
	
	
	
	
