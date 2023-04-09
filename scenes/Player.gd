class_name Player extends CharacterBody3D


const SPEED = 3
var animator : AnimationPlayer
@onready var body = $Body
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var selectedInteractable : PlayerInteractable
var handTrucking : bool = false
func _ready():
	Singleton.player = self
	animator = get_node("Body/Capoeira/AnimationPlayer")
	if(animator != null):
		animator.current_animation = "mixamocom"
		get_node("Body/Capoeira/RootNode/Skeleton3D").motion_scale = .1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var newRotation = Math.look_at(Vector3.ZERO,direction)
	if(newRotation.length() != 0):
		body.global_rotation = newRotation.lerp(body.global_rotation,.9)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		animator.play()
	else:
		velocity.x = move_toward(velocity.x, 0, .15)
		velocity.z = move_toward(velocity.z, 0, .15)
		animator.pause()
	move_and_slide()
	
func _unhandled_input(event):
	if event.is_action_released("interact") and selectedInteractable != null:
		selectedInteractable.interact_from(self)

func _on_area_3d_body_entered(body):
	if body.get_parent() as PlayerInteractable:
		var ibody = body.get_parent()
		ibody.hovered_over()
		selectedInteractable = ibody


func _on_area_3d_body_exited(body):
	if body.get_parent() as PlayerInteractable:
		var ibody = body.get_parent()
		ibody.unhovered_over()
		selectedInteractable = null
