extends CanvasLayer

@onready var SoundTab = $Sound_Tab
func _ready() -> void:
	SoundTab.visible = false
func _on_resume_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	v.save()
func _on_sound_btn_pressed() -> void:
	SoundTab.visible = true

func _on_check_box_toggled(toggled_on: bool) -> void:
	if v.music == true:
		v.music = false
	else:
		v.music = true
