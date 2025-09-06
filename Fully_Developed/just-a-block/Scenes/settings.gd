extends Control

func _ready():
    Input.MOUSE_MODE_VISIBLE
    $MarginContainer2/VBoxContainer/ResolutionMenu.connect("item_selected", _on_resolution_selected)
    $MarginContainer3/VBoxContainer/DisplayModeMenu.connect("item_selected", _on_display_mode_selected)


func _on_volume_value_changed(value: float) -> void:
    AudioServer.set_bus_volume_db(0,value)


func _on_resolution_selected(index: int) -> void:
    match index:
        0:
            DisplayServer.window_set_size(Vector2i(640, 480))
        1:
            DisplayServer.window_set_size(Vector2i(1280, 720))
        2:
            DisplayServer.window_set_size(Vector2i(1920, 1080))
func _on_display_mode_selected(index: int) -> void:
    match index:
        0:
            set_windowed()
        1:
            set_borderless()        
    
func set_windowed():
    Global.is_full_screen = "No"
    DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
    DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
    
func set_borderless():
    Global.is_full_screen = "yes"
    var screen_size = DisplayServer.screen_get_size()
    var screen_id = DisplayServer.window_get_current_screen()
    var screen_pos = DisplayServer.screen_get_position(screen_id)
    
    DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
    
    DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
    
    DisplayServer.window_set_size(screen_size)
    
    DisplayServer.window_set_position(screen_pos)

   
    
func _input(event):
    if event.is_action_pressed("settings"):
        get_tree().change_scene_to_file("res://Scenes/main.tscn")
