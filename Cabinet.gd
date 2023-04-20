class_name Cabinet extends PlayerInteractable
const CAB_BASIC : int = 0
const CAB_GREEN : int = 1
@export var active : bool = false
@export var cabType : int = 0
@export var attractDelay : float = 0
@onready var sg : Singleton = Singleton.current
var previewAngle = 0.0
var startTime = 0.0
var attractOffset = 0.0
var attractCount = 0
#var targetPosition : Vector3
#var targetRotation : Vector3

func _ready():
	startTime = Time.get_ticks_msec()
	attractOffset = randf_range(0,attractDelay)
	var mesh = get_node("Body/MeshInstance3D")
	var mat = load("res://textures/Cabinet.tres").duplicate()
	mesh.set_surface_override_material(0,mat)
	match cabType:
		0:
			pass
		1:
			mat.albedo_color = Color(0,1,0)	
	body = get_node("Body")
	#targetPosition = position
	#targetRotation = rotation

func _process(delta):
	if(body.freeze != !active) :
		body.freeze = !active
	if(attractDelay > 0 and (Time.get_ticks_msec()-startTime)>attractCount*attractDelay):
		print("beeb boop")
		attractCount += 1
		get_tree().call_group("NPCs","attract_available_square",self)

func interact_from(player : Player):
	if player.handTrucking:
		# This cabinet getting placed
		if player.haulingCabinet:
			on_placed(player)
		else: # This cabinet getting picked up
			on_pickup(player)
	else:
		body.rotate_y(PI*.5)

func on_placed(player : Player):
	player.haulingCabinet = null
	player.equippedGear.transformHelper.remote_path = ""
	activate()

func on_pickup(player : Player):
	body.get_node("CollisionShape3D").disabled = true
	player.haulingCabinet = self
	player.equippedGear.transformHelper.remote_path = body.get_path()
	body.transform.origin = Vector3.ZERO			
	body.rotation = Vector3.ZERO
	transform.origin = Vector3.ZERO			
	rotation = Vector3.ZERO

func _physics_process(delta):
	pass#var player = Singleton.player

func activate():
	#targetPosition = position
	#targetRotation = rotation
	body.get_node("CollisionShape3D").disabled = false
	active = true

func preview_rotate(angle : float):
	pass
	#targetRotation.y = angle
	
func _on_rigid_body_3d_mouse_entered():
	hovered_over()
		
func _on_rigid_body_3d_mouse_exited():
	unhovered_over()
