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
var data : CabinetData
#var targetPosition : Vector3
#var targetRotation : Vector3

func _ready():
	data = sg.cabinetDataGenerator.randomVideoGame()
	
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
	var infoText = data.name
	if data.costToPurchase != 0:
		infoText += "\n$" + str(data.costToPurchase)
	infoText += "\nFun Value: " + str(data.funValue)
	$Body/Text/Name.text = infoText
	#$Body/Text/Cost.text = str(data.costToPurchase)
	#$Body/Text/Fun.text = str(data.funValue)
	
	if(body.freeze != !active) :
		body.freeze = !active
	if active:
		if(attractDelay > 0 and (Time.get_ticks_msec()-startTime)>attractCount*attractDelay):
			#print("attract " + str(self))
			attractCount += 1
			get_tree().call_group("NPCs","attract_available_square",self)
			$Body/Glitter.emitting = true

func interact_from(player : Player):
	if player.handTrucking:
		# This cabinet getting placed
		if player.haulingCabinet:
			on_placed(player)
		elif data.costToPurchase < sg.cash: # This cabinet getting picked up
			sg.cash -= data.costToPurchase
			data.costToPurchase = 0
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
	attractDelay = 2000
	body.get_node("CollisionShape3D").disabled = false
	$Body/beams.visible = true
	$Body/beams2.visible = true
	active = true
	
func deactivate():
	attractDelay = 0
	body.get_node("CollisionShape3D").disabled = true
	$Body/beams.visible = true
	$Body/beams2.visible = true
	active = false
