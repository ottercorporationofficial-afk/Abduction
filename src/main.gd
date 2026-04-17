extends Node2D
 
 
func _unhandled_input(event):
	if InputBlocker.is_blocked():
		get_viewport().set_input_as_handled()
		return
 
