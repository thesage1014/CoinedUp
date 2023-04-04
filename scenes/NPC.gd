class_name NPC extends CharacterBody3D
@export var walkSpeed = 3.0
@onready var navAgent : NavigationAgent3D
# Called when the node enters the scene tree for the first time.
func _ready():
	navAgent = get_node("NavigationAgent3D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var pos = global_transform.origin
	var targetPos = navAgent.get_next_path_position()
	var movement = (targetPos - pos).normalized()*walkSpeed
	velocity = velocity.move_toward(movement,.3)
	move_and_slide()


func set_destination(target):
	navAgent.target_position = target

func attract_available_square(cabinet : Cabinet):
	navAgent.target_position = cabinet.global_transform.origin
	print(cabinet)
