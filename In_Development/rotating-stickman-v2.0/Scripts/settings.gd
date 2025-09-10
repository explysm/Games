extends CanvasLayer
@onready var Discord = $Social/Discord
@onready var Discord2 = $Social/Discord2
@onready var Itch = $Social/Itch
@onready var Itch2 = $Social/Itch2

@onready var SoundTab = $Sound_Tab
@onready var Music = $Music

var Playing : bool = false
func _ready():
    hide()
    Discord.visible = false
    Discord2.visible = false
    Itch.visible = false
    Itch2.visible = false
    SoundTab.visible = false

func _process(delta):
     pass
func _on_resume_btn_pressed() -> void:
    hide()
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
    if Playing == true:
        Music.stop()
        Playing = false
    else:
        Music.play()
        Playing = true
    
