extends CanvasLayer

## Hoodies 
@onready var BuyBlue = $BGS/Hoodies/Buttons/BuyBlue
@onready var BoughtBlue = $BGS/Hoodies/Buttons/BoughtBlue

## Multipliers
@onready var x2 = $BGS/Multipliers/Buttons/Buy2x
@onready var x3 = $BGS/Multipliers/Buttons/Buy3x

## Pocket Stickman
@onready var stickman = $BGS/RegularStickman

##Tabs
@onready var hoodies = $BGS/Hoodies
@onready var hoodieButtons = $BGS/Hoodies/Buttons

@onready var multipliers = $BGS/Multipliers

## Main functions
func _ready():
## Hoodies -
	if v.blue == false:
		BoughtBlue.visible = false
	else:
		BuyBlue.visible = false
		BoughtBlue.visible = true
## Multipliers -
	if v.multiplier <1:
		x2.visible = true
		x3.visible = false
	elif v.multiplier == 1:
		x2.visible = false
		x3.visible = true
	elif v.multiplier == 2:
		x3.visible = false
		x2.visible = false

func _process(delta):
	if v.hoodie == 0:
		stickman.animation = "default"
	elif v.hoodie == 2:
		stickman.animation = "blue"

## Buy functions Hoodies
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

## Buy functions multipliers
func _on_buy_2x_pressed() -> void:
	if v.money >449:
		v.multiplier = 1
		x2.visible = false
		x3.visible = true
func _on_buy_3x_pressed() -> void:
	if v.money >1449:
		v.multiplier = 2
		x3.visible = false

## Etc
func _on_default_pressed() -> void:
	v.hoodie = 0
	
## Side Buttons
func _on_multipliers_pressed() -> void:
	hoodies.visible = false
	hoodieButtons.visible = false
	
	multipliers.visible = true
func _on_hoodies_pressed() -> void:
	hoodies.visible = true
	hoodieButtons.visible = true
	
	multipliers.visible = false
func _on_resume_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
