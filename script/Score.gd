extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var showMessage:String=""
	for i in GameInfo.userScores:
		showMessage=showMessage+String.num_int64(i)+":"+String.num_int64(GameInfo.userScores[i])+" "
	self.text=showMessage.left(-1)
	pass
