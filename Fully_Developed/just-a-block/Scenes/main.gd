extends Node3D

func _ready():
    
    if Global.is_full_screen == "Yes":
        var screen_size = DisplayServer.screen_get_size()
        var screen_id = DisplayServer.window_get_current_screen()
        var screen_pos = DisplayServer.screen_get_position(screen_id)
        
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
        
        DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
        
        DisplayServer.window_set_size(screen_size)
        
        DisplayServer.window_set_position(screen_pos)
    else:
     if Global.is_full_screen == "No":
        DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
     else:
        var screen_size = DisplayServer.screen_get_size()
        var screen_id = DisplayServer.window_get_current_screen()
        var screen_pos = DisplayServer.screen_get_position(screen_id)
        
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
        
        DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
        
        DisplayServer.window_set_size(screen_size)
        
        DisplayServer.window_set_position(screen_pos)
   
    
