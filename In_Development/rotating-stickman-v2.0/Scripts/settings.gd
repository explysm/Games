extends CanvasLayer
@onready var Discord = $Social/Discord
@onready var Discord2 = $Social/Discord2
@onready var Itch = $Social/Itch
@onready var Itch2 = $Social/Itch2

@onready var SoundTab = $Sound_Tab

func _ready():
	hide()
	Discord.visible = false
	Discord2.visible = false
	Itch.visible = false
	Itch2.visible = false
	pass
func _on_resume_btn_pressed() -> void:
	hide()
	Discord.visible = false
	Discord2.visible = false
	Itch.visible = false
	Itch2.visible = false
func _on_settings_btn_pressed() -> void:
	show()
	Discord.visible = true
	Discord2.visible = true
	Itch.visible = true
	Itch2.visible = true


func _on_sound_btn_pressed() -> void:
	SoundTab.visible = true


func _on_check_box_toggled(toggled_on: bool) -> void:
	if v.music == true:
		v.music= false
	else:
		v.music = true
	


func _on_save_and_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	v.save()
