class_name FloorTile extends StaticBody3D
var sg = Singleton.current
var cabinets : Array[Cabinet]
@export var active : bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Mesh").set_surface_override_material(0,load("res://textures/floorhelper.tres").duplicate())


func _process(delta):
	get_node("Mesh").visible = sg.controlHandler.placingTile

func add_cabinet(cabinet : Cabinet, destinationPos : Vector3):
		cabinets.append(cabinet)
		add_child(cabinet)
		cabinet.position = destinationPos
		cabinet.rotation = Vector3.ZERO
		cabinet.get_node("Body").input_event.connect(_input_event)
		cabinet.activate()
	

func take_contents(takingCabinet : Cabinet):
	var cabinet = cabinets.find(takingCabinet)
	if(cabinet != null):
		cabinet.active = false
		cabinet.get_node("Body").input_event.disconnect(_input_event)
		remove_child(cabinet)
		var returnObj = cabinet
		cabinet = null
		return returnObj
	else:
		printerr("nothing to take")
		return null

func _input_event(camera, event, position, normal, shape_idx):
	sg.controlHandler._on_tile_input_event(camera, event, position, normal, shape_idx, self)
	#if(event is InputEventMouseButton):

func _mouse_enter():
	get_node("Mesh").get_active_material(0).albedo_color = Color(1,1,1,1)
	sg.controlHandler._on_tile_hovered(self)

func _mouse_exit():
	get_node("Mesh").get_active_material(0).albedo_color = Color(1,1,1,.2)
