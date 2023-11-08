extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(MapInfomation.mapSize.x):
		for j in range(MapInfomation.mapSize.y):
			if (MapInfomation.wallArray[i][j] & 1) == 1:
				for k in range(16):
					self.set_cell(0,Vector2i(i*16+k,j*16),0,Vector2i(0,0))
			if (MapInfomation.wallArray[i][j] & 2) == 2:
				for k in range(16):
					self.set_cell(0,Vector2i(i*16+k,j*16+15),0,Vector2i(0,0))
					pass
			if (MapInfomation.wallArray[i][j] & 4) == 4:
				for k in range(16):
					self.set_cell(0,Vector2i(i*16,j*16+k),0,Vector2i(0,0))
			if (MapInfomation.wallArray[i][j] & 8) == 8:
				for k in range(16):
					self.set_cell(0,Vector2i(i*16+15,j*16+k),0,Vector2i(0,0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
