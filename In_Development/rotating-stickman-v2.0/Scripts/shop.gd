extends CanvasLayer

@onready var BuyBlue = $BGS/Hoodies/Buttons/BuyBlue
@onready var BoughtBlue = $BGS/Hoodies/Buttons/BoughtBlue
@onready var stickman = $BGS/RegularStickman
func _ready():
	if v.blue == false:
		BoughtBlue.visible = false
	else:
		BuyBlue.visible = false
		BoughtBlue.visible = true

func _process(delta):
	if v.hoodie == 0:
		stickman.animation = "default"
	elif v.hoodie == 2:
		stickman.animation = "blue"
func _on_resume_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_buy_blue_pressed() -> void:
	if v.money >199:
		v.hoodie = 2
		v.money -= 200
		BuyBlue.visible = false
		BoughtBlue.visible = true
		v.blue = true
		print("Bought Blue Hoodie for $200a")
func _on_bought_blue_pressed() -> void:
	v.hoodie = 2


func _on_default_pressed() -> void:
	v.hoodie = 0
