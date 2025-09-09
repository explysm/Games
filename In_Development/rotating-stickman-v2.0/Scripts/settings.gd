extends CanvasLayer
@onready var Discord = $Social/Discord
@onready var Discord2 = $Social/Discord2
@onready var Itch = $Social/Itch
@onready var Itch2 = $Social/Itch2

func _ready():
    hide()
    Discord.visible = false
    Discord2.visible = false
    Itch.visible = false
    Itch2.visible = false

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
