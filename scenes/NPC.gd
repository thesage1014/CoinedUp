class_name NPC extends CharacterBody3D
@export var walkSpeed = 3.0
@onready var navAgent = $NavigationAgent3D
@onready var animTree = $Body/AnimationTree
@onready var animator = $Body/AnimationPlayer
var moveTowardsTarget := false
# Called when the node enters the scene tree for the first time.
func _ready():
	animator.play("walk and idle/Walking")
	$Blackboard.set_value("NPC",self)	
	animTree.set("parameters/TimeScale/scale",2.6)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity += ProjectSettings.get_setting("physics/3d/default_gravity_vector")
	if(moveTowardsTarget):
		var pos = global_transform.origin
		var targetPos = navAgent.get_next_path_position()
		var facing_angle = Math.zx(targetPos-pos).angle()
		var newRotation = lerp_angle(global_rotation.y,facing_angle,.2)
		if(navAgent.distance_to_target()>.1):
			global_rotation = newRotation * Vector3.UP
			velocity = (targetPos - pos).normalized()*walkSpeed
	move_and_slide()


func set_destination(target):
	navAgent.target_position = target

func attract_available_square(cabinet : Cabinet):
	pass
#	if !navAgent.is_target_reached():
#		navAgent.target_position = cabinet.body.global_position
#		print("attracted to" + str(cabinet))
