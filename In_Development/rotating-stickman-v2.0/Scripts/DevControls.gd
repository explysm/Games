extends CanvasLayer

@onready var MoneyEdit = $DevControls/MoneyEdit/Money

func _ready() -> void:
	MoneyEdit.value = v.money

func _on_money_value_changed(value: float) -> void:
	v.money = MoneyEdit.value
	print("Money: ", v.money)
	v.save()
