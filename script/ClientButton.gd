extends Button

const wsUrl:String="ws://127.0.0.1:3000"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var cSocket:WebSocketMultiplayerPeer=WebSocketMultiplayerPeer.new()
	cSocket.create_client("127.0.0.1:3000")
	multiplayer.multiplayer_peer=cSocket
	pass # Replace with function body.
