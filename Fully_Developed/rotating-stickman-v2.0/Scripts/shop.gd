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
@onready var hats = $BGS/Hats
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
## Hats
	if v.lavendervase == true:
		$BGS/Hats/BuyLavenderVase.visible = false
		$BGS/Hats/BoughtLavenderVase.visible = true
	else:
		$BGS/Hats/BoughtLavenderVase.visible = false
func _process(_delta):
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
		v.save()
func _on_bought_blue_pressed() -> void:
	v.hoodie = 2
	v.save()
func _on_buy_red_pressed() -> void:
	if v.money > 499:
		v.hoodie = 3
		v.money -=500
		BuyRed.visible = false
		BoughtRed.visible = true
		v.red = true
		print("Bought Red Hoodie for 500$")
		v.save()
func _on_bought_red_pressed() -> void:
	v.hoodie = 3
	v.save()

## Buy functions multipliers
func _on_buy_2x_pressed() -> void:
	if v.money >449:
		v.multiplier = 1
		x2.visible = false
		x3.visible = true
		v.money -=500
		v.save()
func _on_buy_3x_pressed() -> void:
	if v.money >1449:
		v.multiplier = 2
		x3.visible = false
		v.money -=1500
		v.save()
		
## Buy functions hats
func _on_buy_lavender_vase_pressed() -> void:
	if v.money >199:
		v.hat = 1
		v.lavendervase = true
		$BGS/Hats/BuyLavenderVase.visible = false
		$BGS/Hats/BoughtLavenderVase.visible = true
		v.money -=200
		v.save()
## -----------------------------------------------------
func _on_bought_lavender_vase_pressed() -> void:
	v.hat = 1
	v.save()
## Etc
func _on_default_pressed() -> void:
	v.hoodie = 0
func buy():
	v.save()

func _on_remove_hat_pressed() -> void:
	v.hat = 0
	v.save()
## Side Buttons
func _on_multipliers_pressed() -> void:
	hoodies.visible = false
	hoodieButtons.visible = false
	
	multipliers.visible = true
	hats.visible = false
func _on_hoodies_pressed() -> void:
	hoodies.visible = true
	hoodieButtons.visible = true
	
	multipliers.visible = false
	hats.visible = false
func _on_hats_pressed() -> void:
	hats.visible = true
	
	hoodies.visible = false
	hoodieButtons.visible = false
	multipliers.visible = false
func _on_resume_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	v.save()
