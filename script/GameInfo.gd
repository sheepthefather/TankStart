extends Node
# Called when the node enters the scene tree for the first time.

var gameOver:bool=true
var gameRound:int=0
var meTankPosition:Vector2=Vector2(0,0)
var userScores:Dictionary

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func loadGame()->void:
	var velocity:Vector2=Vector2(randi_range(0,MapInfomation.mapSize.x-1)*64+32,randi_range(0,MapInfomation.mapSize.y-1)*64+32)
	meTankPosition=velocity
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
	pass

func initWallAndStart()->void:
	if multiplayer.is_server():
		MapInfomation.initWall()
		self.changeWallArray.rpc(MapInfomation.wallArray)
	
@rpc("any_peer","call_local","reliable")
func changeWallArray(wallArray)->void:
	MapInfomation.wallArray=wallArray
	loadGame()
	pass

@rpc("authority","call_local")
func setScore(userScores:Dictionary)->void:
	self.userScores=userScores
