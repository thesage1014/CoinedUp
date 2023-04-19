class_name NPC extends CharacterBody3D
@export var walkSpeed = 3.0
@onready var navAgent = $NavigationAgent3D
@onready var animator = $Body/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animator.play("walk and idle/Walking")

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
	if(movement.length()):
		animator.play("walk and idle/Walking")
	else:
		animator.play("walk and idle/Idle")	
	move_and_slide()


func set_destination(target):
	navAgent.target_position = target

func attract_available_square(cabinet : Cabinet):
	navAgent.target_position = cabinet.global_transform.origin
	print(cabinet)
