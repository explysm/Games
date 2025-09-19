extends CanvasLayer

@onready var SoundTab = $Sound_Tab
@onready var server = $Server_Tab

func _ready():
	server.visible = false
	SoundTab.visible = false
func _on_resume_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	
func _on_sound_btn_pressed() -> void:
	SoundTab.visible = true
	server.visible = false
func _on_server_btn_pressed() -> void:
	server.visible = true
	SoundTab.visible = false

func _on_check_box_toggled(toggled_on: bool) -> void:
	if v.music == true:
		v.music= false
	else:
		v.music = true
	
