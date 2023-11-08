extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var wHeight:float=MapInfomation.mapSize.y
	var wWidth:float=MapInfomation.mapSize.x
	var step:float=MapInfomation.mapStep
	self.zoom.x=get_window().size.y/(wHeight*step)
	self.zoom.y=get_window().size.y/(wHeight*step)
	$Node/Score.anchor_right=1/self.zoom.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
