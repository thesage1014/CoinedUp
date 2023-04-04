extends Node3D
var startTime
var spawnedNPCs = 0
@export var spawnDelay = 5000
@export var NPCscene : PackedScene
@export var maxSpawns = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	startTime = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((Time.get_ticks_msec() - startTime) > spawnedNPCs * spawnDelay and spawnedNPCs < maxSpawns):
		add_child(NPCscene.instantiate())
		spawnedNPCs += 1
