extends CharacterBody2D

var direction:Vector2=Vector2.ZERO
const SPEED:float=200

func _physics_process(delta):
	if get_parent().name.left(get_parent().name.length()-"Shells".length())!=String.num_int64(multiplayer.get_unique_id()):
		return
	setPosition.rpc(self.global_position)
	var collision:KinematicCollision2D=move_and_collide(direction*SPEED*delta)
	if collision:
		if !collision.get_collider() is StaticBody2D || collision.get_collider() is CharacterBody2D:
			direction=direction.bounce(collision.get_normal())
			return
			pass
		
		#tank delete
		destructionTank.rpc(collision.get_collider().name)
		deleteShell.rpc()
	pass

func start(direction:Vector2)->void:
	$Shell.modulate=Color(randf(),randf(),randf())
	self.direction=direction.normalized()
	pass

@rpc("any_peer","call_remote")
func setPosition(position:Vector2)->void:
	self.global_position=position
	pass


func _on_timer_timeout():
	if get_parent().name.left(get_parent().name.length()-"Shells".length())!=String.num_int64(multiplayer.get_unique_id()):
		return
	deleteShell.rpc()
	pass # Replace with function body.
@rpc("any_peer","call_local","reliable")
func deleteShell()->void:
	self.queue_free()

@rpc("any_peer","call_local","reliable")
func destructionTank(tankId:String)->void:
	self.get_node("../../"+tankId+"/Tank").visible=false
	self.get_node("../../"+tankId+"/CollisionPolygon2D").set_deferred("disabled",true)
	self.get_node("../../"+tankId+"/Boom").emitting=true
	self.get_node("../../"+tankId+"/Boom").emitted=true
	pass
