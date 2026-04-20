extends ColorRect

func _process(delta: float) -> void:
	position = get_global_mouse_position() 
	position.x += 27 
	position.y += 25
