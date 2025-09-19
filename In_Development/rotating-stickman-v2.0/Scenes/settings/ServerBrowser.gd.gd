extends Control

@onready var ip_address_line_edit = $IPAddressLineEdit

func _on_Host_button_pressed():
	# Assuming MultiplayerManager is an Autoload
	get_node("/root/MultiplayerManager").host_game()

func _on_Join_pressed():
	var ip_address = ip_address_line_edit.text
	# Call the join function with the IP from the LineEdit
	get_node("/root/MultiplayerManager").join_game_by_ip(ip_address)
