extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GameInfo.gameRound=GameInfo.gameRound+1
	var peerIds:PackedInt32Array=multiplayer.get_peers()
	var meTank:Node2D=preload("res://scenes/Tank.tscn").instantiate()
	meTank.name=String.num_int64(multiplayer.get_unique_id())
	self.add_child(meTank)
	var meShells:Node=Node.new()
	meShells.name=String.num_int64(multiplayer.get_unique_id())+"Shells"
	self.add_child(meShells)
	for i in peerIds:
		var tank:Node2D=preload("res://scenes/Tank.tscn").instantiate()
		tank.name=String.num_int64(i)
		self.add_child(tank)
		var shells:Node=Node.new()
		shells.name=String.num_int64(i)+"Shells"
		self.add_child(shells)
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func getSurvivalUserNum()->int:
	var nodes:Array[Node]=get_children()
	var userNum:int=0
	for i in nodes:
		if i is StaticBody2D && i.get_node("./Tank").visible:
			userNum+=1
	return userNum
	
func getSurvivalUser()->Array[int]:
	var tanks:Array[int]
	for i in self.get_children():
		if i is StaticBody2D && i.get_node("./Tank").visible:
			tanks.append(i.name.to_int())
	return tanks
	
