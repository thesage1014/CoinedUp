class_name NPC extends CharacterBody3D
@export var walkSpeed = 3.0
@onready var navAgent : NavigationAgent3D
var animator : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	navAgent = get_node("NavigationAgent3D")
	animator = get_node("Capoeira/AnimationPlayer")
	if(animator != null):
		animator.current_animation = "mixamocom"
		get_node("Capoeira/RootNode/Skeleton3D").motion_scale = .1
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var pos = global_transform.origin
	var targetPos = navAgent.get_next_path_position()
	global_rotation = global_rotation.slerp( Math.look_at(pos,targetPos),.1)#Vector3(0,targetAngle,0),.1)
	var movement = (targetPos - pos).normalized()*walkSpeed - velocity*.1
	velocity = movement#velocity.move_toward(movement,.3)
	move_and_slide()


func set_destination(target):
	navAgent.target_position = target

func attract_available_square(cabinet : Cabinet):
	navAgent.target_position = cabinet.global_transform.origin
	print(cabinet)
