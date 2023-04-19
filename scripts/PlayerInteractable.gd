class_name PlayerInteractable extends Node3D
@onready var body : RigidBody3D = $Body
var initialBodyPos : Vector3
var initialBodyAng : Vector3


func _ready():
	initialBodyPos = body.transform.origin
	initialBodyAng = body.rotation

func hovered_over():
	body.get_node("MeshInstance3D").get_active_material(0).emission_energy_multiplier = .1

func unhovered_over():
	body.get_node("MeshInstance3D").get_active_material(0).emission_energy_multiplier = 0

func interact_from(player : Player):
	print("Unhandled interact with ", self)
