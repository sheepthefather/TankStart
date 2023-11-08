extends GPUParticles2D

var emitted:bool=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if emitted && !emitting:
		emitted=false
		#next round
		print(get_node("/root/Main").getSurvivalUserNum())
		if get_node("/root/Main").getSurvivalUserNum()<=1:
			if multiplayer.is_server():
				GameInfo.initWallAndStart()
				var survivalTanks:Array[int]=get_node("/root/Main").getSurvivalUser()
				if survivalTanks.size()==1:	
					GameInfo.userScores[survivalTanks[0]]=GameInfo.userScores[survivalTanks[0]]+1
					GameInfo.setScore(GameInfo.userScores)

	pass

