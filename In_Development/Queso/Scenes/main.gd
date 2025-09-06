extends Node3D

@onready var Label1 = $CanvasLayer/Control/Label
@onready var Label2 = $CanvasLayer/Control/Label2
@onready var Label3 = $CanvasLayer/Control/Label3
@onready var Label4 = $CanvasLayer/Control/Label4
@onready var Label5 = $CanvasLayer/Control/Label5
@onready var LBG = $CanvasLayer/Control/ColorRect
@onready var Caseoh = $Caseoh
@onready var audio = $Area3D/AudioStreamPlayer3D
@onready var continue1 = $CanvasLayer/Control/continue
@onready var MobileControls = $CanvasLayer3

var shown = false
func _ready():
	MobileControls.visible = false
	Caseoh.visible = false
	
	Label1.visible = false
	Label2.visible = false
	Label3.visible = false
	Label4.visible = false
	Label5.visible = false
	continue1.visible = false
	LBG.visible = false
	
	
	


func _on_area_3d_body_entered(body: Node3D) -> void:
	if shown == false:
		Label1.visible = true
		LBG.visible = true
	
	



func _on_area_3d_body_exited(body: Node3D) -> void:
	Label1.visible = false
	LBG.visible = false
func _on_area_3d_2_body_entered(body: Node3D) -> void:
	Caseoh.visible = true
	audio.play()
	shown = true
	if shown == true:
		Label2.visible = true
		LBG.visible = true
		await get_tree().create_timer(3.0).timeout
		Label2.visible = false
		Label3.visible = true
		await get_tree().create_timer(3.0).timeout
		Label3.visible = false
		Label4.visible = true
		await get_tree().create_timer(3.0).timeout
		Label4.visible = false
		Label5.visible = true
		


func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		MobileControls.visible = true
	if toggled_on == false:
		MobileControls.visible = false
	pass # Replace with function body.
