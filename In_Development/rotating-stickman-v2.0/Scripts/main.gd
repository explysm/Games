extends CanvasLayer
@onready var money_count = $MainScene/Money/Money_Count

var x2 : bool = false
func _ready():
	money_count.text = str(v.money)
func _on_money_click_pressed() -> void:
	if x2 == false:
		v.money += 5
		money_count.text = str(v.money)
		print(v.money)
	pass # Replace with function body.


func _on_shop_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/shop.tscn")
