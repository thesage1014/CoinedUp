class_name NPC extends CharacterBody3D
@export var walkSpeed = 3.0
@onready var navAgent = $NavigationAgent3D
@onready var animTree = $Body/AnimationTree
@onready var animator = $Body/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animator.play("walk and idle/Walking")
	$Blackboard.set_value("NPC",self)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var pos = global_transform.origin
	var targetPos = navAgent.get_next_path_position()
	var facing_angle = Math.zx(targetPos-pos).angle()
	var newRotation = lerp_angle(global_rotation.y,facing_angle,.2)
	global_rotation = newRotation * Vector3.UP
	var movement = Vector3.ZERO
	if(navAgent.distance_to_target()>.2):
		movement = (targetPos - pos).normalized()*walkSpeed
	velocity = movement#velocity.move_toward(movement,.3)
	animTree.set("parameters/TimeScale/scale",2.6)
	move_and_slide()


func set_destination(target):
	navAgent.target_position = target

func attract_available_square(cabinet : Cabinet):
	if !navAgent.is_target_reached():
		navAgent.target_position = cabinet.body.global_position
		print("attracted to" + str(cabinet))
