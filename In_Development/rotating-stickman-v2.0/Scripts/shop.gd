extends CanvasLayer

## Hoodies 
@onready var BuyBlue = $BGS/Hoodies/Buttons/BuyBlue
@onready var BoughtBlue = $BGS/Hoodies/Buttons/BoughtBlue

@onready var BuyRed = $BGS/Hoodies/Buttons/BuyRed
@onready var BoughtRed = $BGS/Hoodies/Buttons/BoughtRed
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
		
	if v.red == false:
		BoughtRed.visible = false
	else:
		BuyRed.visible = false
		BoughtRed.visible = true
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
	elif v.hoodie == 3:
		stickman.animation = "red"

## Buy functions Hoodies
func _on_buy_blue_pressed() -> void:
	if v.money >199:
		v.hoodie = 2
		v.money -= 200
		BuyBlue.visible = false
		BoughtBlue.visible = true
		v.blue = true
		print("Bought Blue Hoodie for 200$")
func _on_bought_blue_pressed() -> void:
	v.hoodie = 2
	
func _on_buy_red_pressed() -> void:
	if v.money > 499:
		v.hoodie = 3
		v.money -=500
		BuyRed.visible = false
		BoughtRed.visible = true
		v.red = true
		print("Bought Red Hoodie for 500$")
func _on_bought_red_pressed() -> void:
	v.hoodie = 3

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
