extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if self.name!=String.num_int64(multiplayer.get_unique_id()):
		return
	if !get_node("./Tank").visible:
		return
	setPosition.rpc(GameInfo.meTankPosition,self.rotation)
	var velocity=Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity=Vector2.DOWN
	if Input.is_action_pressed("ui_down"):
		velocity=Vector2.UP
	if Input.is_action_pressed("ui_left"):
		rotation+=-0.1
	if Input.is_action_pressed("ui_right"):
		rotation+=0.1
	velocity=velocity.normalized().rotated(rotation)
	self.move_and_collide(velocity)
	GameInfo.meTankPosition=global_position
	# shot a shell
	if Input.is_action_just_pressed("ui_accept"):
		createShell.rpc(multiplayer.get_unique_id(),Time.get_ticks_msec())
	pass
	
@rpc("any_peer","call_local","reliable",1)
func setPosition(velocity:Vector2,rotation:float)->void:
	global_position=velocity
	self.rotation=rotation
	pass

@rpc("any_peer","call_local")
func createShell(id:int,mTime:int)->void:
	var shells:Node=self.get_node("../"+String.num_int64(id)+"Shells")
	var shellPosition:Vector2=Vector2.ZERO
	var shellShifting:Vector2=Vector2.ZERO
	shellShifting=Vector2(0,25)
	shellShifting=shellShifting.rotated(self.rotation)
	shellPosition=self.global_position+shellShifting
	var shell:Node=preload("res://scenes/Shell.tscn").instantiate()
	shell.global_position=shellPosition
	shell.name=String.num_int64(mTime)
	if String.num_int64(multiplayer.get_unique_id())!=self.name:
		shellShifting=Vector2.ZERO
	shell.start(shellShifting)
	shells.add_child(shell)
	pass
