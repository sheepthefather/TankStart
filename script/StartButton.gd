extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	GameInfo.userScores.clear()
	GameInfo.userScores[multiplayer.get_unique_id()]=0
	for i in multiplayer.get_peers():
		GameInfo.userScores[i]=0
	if multiplayer.is_server():
		GameInfo.initWallAndStart()
	pass # Replace with function body.
