extends CanvasLayer

@onready var money_count = $MainScene/Money/Money_Count
@onready var music = $Music
@onready var settings = $Settings

func _ready():
	v.load()
	money_count.text = str(v.money)
	settings.visible = false
func _process(delta: float) -> void:
	if v.music == true:
		music.play()
	elif v.music == false:
		music.stop()

func _on_money_click_pressed() -> void:
	if v.multiplier <1:
		v.money += 5
		money_count.text = str(v.money)
		print(v.money)
	elif  v.multiplier == 1:
		v.money += 10
		money_count.text = str(v.money)
		print(v.money)
	elif  v.multiplier == 2:
		v.money += 15
		money_count.text = str(v.money)
		print(v.money)

func _on_shop_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/shop.tscn")


func _on_settings_btn_pressed() -> void:
	settings.visible = true
