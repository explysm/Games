extends CharacterBody3D



@export var dpad: Node

const SPEED = 5.0
const MOUSE_SENSITIVITY = 0.003


@onready var camera = $Camera3D
@onready var footstep = $AudioStreamPlayer3D
  # Drag DPad node here in the editor

var rotation_x = 0.0
var dpad_dir := Vector2.ZERO

func _ready():

    var dpad = get_tree().get_root().find_child("DPad", true, false)
    if dpad:
        dpad.direction_changed.connect(_on_dpad_direction_changed)
    else:
        print("DPad not found")
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    if dpad:
        dpad.direction_changed.connect(_on_dpad_direction_changed)

func _on_dpad_direction_changed(new_dir: Vector2):
    dpad_dir = new_dir
    print("h ", new_dir)

func _unhandled_input(event):
    if event is InputEventMouseMotion:
        rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
        rotation_x = clamp(rotation_x - event.relative.y * MOUSE_SENSITIVITY, -1.5, 1.5)
        camera.rotation.x = rotation_x

func _physics_process(delta):
    var input_dir = Vector3.ZERO

    # WASD movement
    if Input.is_action_pressed("move_forward"):
        input_dir -= transform.basis.z
    if Input.is_action_pressed("move_back"):
        input_dir += transform.basis.z
    if Input.is_action_pressed("move_left"):
        input_dir -= transform.basis.x
    if Input.is_action_pressed("move_right"):
        input_dir += transform.basis.x
    if input_dir == Vector3.ZERO and dpad_dir != Vector2.ZERO:
        input_dir += -transform.basis.z * dpad_dir.y
        input_dir += -transform.basis.x * dpad_dir.x

    velocity = input_dir.normalized() * SPEED
    move_and_slide()
    
    if velocity.length() > 0:
        if not footstep.playing:
            footstep.play()
        else:
            if footstep.playing:
                footstep.stop
func _input(event):
    if event.is_action_pressed("settings"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
        get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
