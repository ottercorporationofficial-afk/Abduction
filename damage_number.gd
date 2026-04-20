extends Node2D

@onready var label: Label = $Label

func setup(amount: int, is_crit: bool):
	label.text = str(amount)
	
	if is_crit:
		label.modulate = Color.RED
		label.scale = Vector2(1.4,1.4)
		
	else:
		label.modulate = Color.WHITE
		label.scale = Vector2.ONE
	
	# small random horizontal offset
	position.x += randf_range(-6,6)
	
	var tween := create_tween()
	tween.tween_property(self,"position:y",position.y - 28, 0.6)
	tween.tween_property(self,"modulate:a",0.0,0.6)
	tween.finished.connect(queue_free)
