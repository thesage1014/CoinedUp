class_name ControlHandler extends Node
@export var nav:NavigationRegion3D
var sg = Singleton.current

func _ready():
	sg.controlHandler = self

#func _process(delta):
#	pass
	
#func _physics_process(delta):

#func _input(event):
#	pass
