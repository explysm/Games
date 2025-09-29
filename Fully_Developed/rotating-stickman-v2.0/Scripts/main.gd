extends CanvasLayer

@onready var money_count = $MainScene/Money/Money_Count
@onready var music = $Music
@onready var settings = $Settings
@onready var dev = $Dev

var devVisible : bool = false
func _ready():
	v.load()
	money_count.text = str(v.money)
	settings.visible = false
	dev.visible = false
func _process(delta: float) -> void:
	if Input.is_action_pressed("dev"):
		if devVisible == true:
			dev.visible = false
			devVisible = false
		else:
			dev.visible = true
			devVisible = true

	money_count.text = str(v.money)
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
	v.save()
func _on_shop_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/shop.tscn")


func _on_settings_btn_pressed() -> void:
	settings.visible = true
