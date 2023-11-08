extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var sSocket:WebSocketMultiplayerPeer=WebSocketMultiplayerPeer.new()
	sSocket.create_server(3000)
	sSocket.peer_connected.connect(WebSocketInternet.onConnectionFromClient)
	multiplayer.multiplayer_peer=sSocket
	pass # Replace with function body.
