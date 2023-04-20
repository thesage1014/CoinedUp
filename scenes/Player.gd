class_name Player extends CharacterBody3D

var moveSpeed = 3
@onready var animator = $Body/Body/AnimationPlayer
@onready var animTree = $Body/Body/AnimationTree
@onready var body = $Body

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var selectedInteractable : PlayerInteractable
var handTrucking : bool = false
var equippedGear : Equipment
var haulingCabinet : Cabinet

func _ready():
	Singleton.player = self

func _physics_process(delta):
	if not is_on_floor(): # Gravity
		velocity.y -= gravity * delta

	var inputDir = Input.get_vector("left", "right", "up", "down")
	var targetDir = (transform.basis * Vector3(inputDir.x, 0, inputDir.y)).normalized()
	var facing_angle = Vector2(targetDir.z,targetDir.x).angle()
	var newRotation = lerp_angle(body.global_rotation.y,facing_angle,moveSpeed*.05)
	if(inputDir.length() != 0):
		body.global_rotation = newRotation*Vector3.UP
	
	if haulingCabinet:
		moveSpeed = 2.5
	else:
		if Input.is_action_pressed("sprint"):
			moveSpeed = 6
			animTree.set("parameters/TimeScale/scale",2.6)
		else:
			moveSpeed = 3
			animTree.set("parameters/TimeScale/scale",1.3)
		
	if targetDir:
		velocity.x = move_toward(velocity.x, targetDir.x * moveSpeed, .2)
		velocity.z = move_toward(velocity.z, targetDir.z * moveSpeed, .2)
	else:
		velocity.x = move_toward(velocity.x, 0, .15)
		velocity.z = move_toward(velocity.z, 0, .15)
	animTree.set("parameters/WalkOrIdle/blend_amount", min(1,velocity.length()*2))
	move_and_slide()

func equip(gear : Equipment):
	if(!equippedGear):
		equippedGear = gear
		gear.get_parent().remove_child(gear)
		body.add_child(gear)
		gear.transform.origin = Vector3.ZERO
		gear.rotation = Vector3.ZERO
		if(gear is HandTruck):
			handTrucking = true

func unequip(gear : Equipment):
	#body.remove_child(gear)
	gear.reparent(get_parent(),true)
	gear.global_translate(Vector3(0,.1,0))
	equippedGear = null
	handTrucking = false

func _unhandled_input(event):
	if event.is_action_released("interact"):
		if haulingCabinet :
			haulingCabinet.interact_from(self)
		else:
			if selectedInteractable != null:
				selectedInteractable.interact_from(self)
			elif equippedGear != null:
				equippedGear.unequip_to(self)
	

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
