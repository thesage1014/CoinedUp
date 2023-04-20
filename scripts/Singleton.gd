extends Node
var current = self
var controlHandler : ControlHandler
var camera : Camera3D
var player : Player
var cabinetDataGenerator := CabinetDataGenerator.new()

var cash := 600.0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(load("res://scenes/UI.tscn").instantiate())
	
	
func _physics_process(delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI/Cash.text = "$" + str(snappedf(cash,.01))
