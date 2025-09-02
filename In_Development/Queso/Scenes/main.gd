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

var shown = false
func _ready():
	Caseoh.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
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
