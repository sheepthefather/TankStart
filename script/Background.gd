extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	for y in range(MapInfomation.mapSize.y):
		for x in range(MapInfomation.mapSize.x):
			self.set_cell(0,Vector2i(x,y),0,Vector2i(0,0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
