extends Camera3D

var zoom = -7.0
var cameraAngle = rotation.x
# Called when the node enters the scene tree for the first time.
func _ready():
	Singleton.current.camera = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = Singleton.player.global_position + (Vector3.FORWARD.rotated(Vector3.RIGHT,cameraAngle)*zoom)

func _unhandled_input(event):
	if(event.is_action_released("zoom_out")):
		zoom -= 1
	elif(event.is_action_released("zoom_in")):
		zoom += 1
			
