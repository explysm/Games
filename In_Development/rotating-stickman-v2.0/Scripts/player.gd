extends CharacterBody2D

@export var speed : float = 400
@export var joystick_left : VirtualJoystick
@export var joystick_right : VirtualJoystick
var screen_size
var move_vector := Vector2.ZERO

func _ready():
    screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
    var velocity = Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        velocity.x += 1
    if Input.is_action_pressed("move_left"):
        velocity.x -= 1
    if Input.is_action_pressed("move_down"):
        velocity.y += 1
    if Input.is_action_pressed("move_up"):
        velocity.y -= 1

    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        $AnimatedSprite2D.play()
    else:
        $AnimatedSprite2D.stop()
    position += velocity * delta
    
    if v.hoodie == 0:
        if velocity.x != 0:
            $AnimatedSprite2D.animation = "Rotating"
            $AnimatedSprite2D.flip_v = false
        # See the note below about the following boolean assignment.
            $AnimatedSprite2D.flip_h = velocity.x < 0
        elif velocity.y != 0:
            $AnimatedSprite2D.animation = "Rotating"
            $AnimatedSprite2D.flip_v = velocity.y > 0
            
    elif v.hoodie == 1:
        if velocity.x != 0:
            $AnimatedSprite2D.animation = "Blue_Rotating"
            $AnimatedSprite2D.flip_v = false
        # See the note below about the following boolean assignment.
            $AnimatedSprite2D.flip_h = velocity.x < 0
        elif velocity.y != 0:
            $AnimatedSprite2D.animation = "Blue_Rotating"
            $AnimatedSprite2D.flip_v = velocity.y > 0
     # Movement using Input functions:
    move_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    position += move_vector * speed * delta
    
    # Rotation:
    if joystick_right and joystick_right.is_pressed:
        rotation = joystick_right.output.angle()
