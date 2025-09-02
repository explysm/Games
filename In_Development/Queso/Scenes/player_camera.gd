extends Camera3D

@export var rotation_speed : float = 5.0
var target_rotation : Vector3
var returning : bool = false
var original_rotation : Vector3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	original_rotation = rotation
	target_rotation = rotation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
