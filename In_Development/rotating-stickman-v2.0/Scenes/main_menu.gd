extends Control



func _on_play_pressed() -> void:
	v.load()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings/settingsMM.tscn")
