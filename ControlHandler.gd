class_name ControlHandler extends Node
@export var nav:NavigationRegion3D
var sg = Singleton.current
var selectedCabinet : Cabinet = null
var selectedTile : FloorTile = null
var cab_scene = load("res://scenes/Cabinet.tscn")
var brush : Node3D
var placingTile = false
var placingAngle = false
var placingOrigin = Vector2(0,0)

func _ready():
	sg.controlHandler = self

func _process(delta):
	pass
	
#func _physics_process(delta):

func _input(event):
	if(event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.pressed):
		if(placingAngle):
			selectedCabinet = null
			placingAngle = false
#		var viewPos = event.position
#		var normal = get_viewport().get_camera().project_ray_normal(viewPos)
#		var origin = get_viewport().get_camera().project_ray_origin(viewPos)
#		var ray = get_world().direct_space_state.intersect_ray(origin, origin+normal*100, [], node_area.collision_layer,false,true)
#		#get_world().direct_space_state.intersect_ray(from, to, [], node_area.collision_layer,false,true)
#

# TODO: move this into floortile
func _on_free_cabinet_clicked(cabinet:Cabinet, event):
	if(selectedCabinet == null):
		selectedCabinet = cabinet
		cabinet.active = false
		placingTile = true
		if(cabinet.get_parent() != null):
			cabinet.get_parent().remove_child(cabinet)
		add_child(cabinet)
		move_to_brush(cabinet)

func _on_tile_hovered(tile : FloorTile):
	if(!placingAngle):
		selectedTile = tile
	
func _on_tile_input_event(camera, event, position, normal, shape_idx, tile:FloorTile):
	if(event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.pressed):
		get_tree().call_group("NPCs","set_destination",position)
		if(placingAngle):
			selectedCabinet = null
			placingAngle = false
		elif(selectedTile.active):
			selectedTile = tile
			if(selectedTile.cabinet == null):
				if(selectedCabinet != null):
					remove_child(selectedCabinet)
					selectedTile.set_contents(selectedCabinet)
					placingTile = false
					placingAngle = true
					placingOrigin = event.position
					nav.bake_navigation_mesh()
			elif(selectedCabinet == null and !placingAngle):
				selectedCabinet = selectedTile.take_contents()
				add_child(selectedCabinet)
				move_to_brush(selectedCabinet)
				placingTile = true
	elif(event is InputEventMouseMotion):
		if(placingAngle):
			selectedTile.cabinet.preview_rotate((-(event.position - placingOrigin).angle())+PI*.5)

func move_to_brush(cabinet : Cabinet):
	cabinet.global_transform = sg.camera.get_node("./Cabinet").global_transform
