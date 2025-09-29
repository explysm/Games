extends Node

var peer = ENetMultiplayerPeer.new()
var player_scene = preload("res://Scenes/player.tscn")
const HOST_PORT = 7777

# This function is called when the "Host" button is pressed
func host_game():
	peer.create_server(HOST_PORT, 8)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(_on_peer_connected)
	
	# Load the main game scene
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

# This function is called when the "Join" button is pressed
func join_game_by_ip(ip_address):
	peer.create_client(ip_address, HOST_PORT)
	multiplayer.multiplayer_peer = peer
	
	# Load the main game scene
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
# Called when a new peer connects (on the server)
func _on_peer_connected(id):
	if multiplayer.is_server():
		var player = player_scene.instantiate()
		player.name = str(id)
		player.set_multiplayer_authority(id)
		get_tree().root.get_node("Main").add_child(player)

func disconnect_game():
	if multiplayer.multiplayer_peer:
		multiplayer.multiplayer_peer.close()
		multiplayer.multiplayer_peer = null
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
