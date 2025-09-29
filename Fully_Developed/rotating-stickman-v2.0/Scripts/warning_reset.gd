extends Panel


func _ready() -> void:
	hide()
func _on_yes_pressed() -> void:
	v.reset_game()
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_reset_pressed() -> void:
	show()
