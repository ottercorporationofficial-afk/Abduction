extends CharacterBody2D

 


func _on_click_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		TweenFX.creep_out(self)
