extends CollisionShape3D

var tileScene : PackedScene = load("res://scenes/FloorTile.tscn")
var floorTiles = []
var grid_width = 10
var grid_height = 10
func _ready():
	for i in grid_width:
		floorTiles.append([])
		for j in grid_height:
			var newScene = tileScene.instantiate()
			floorTiles[i].append(newScene)
			add_child(newScene)
			newScene.position = Vector3(i-grid_width/2+.5,.1,j-grid_height/2+.5)
		
	



func _process(delta):
	pass

