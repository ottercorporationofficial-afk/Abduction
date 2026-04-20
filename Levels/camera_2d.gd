extends Camera2D

var shake_strength := 0.0
var shake_decay := 8.0

func _process(delta: float) -> void:
	if shake_strength > 0:
		offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
		shake_strength = lerp(shake_strength, 0.0, shake_decay * delta)
	else:
		offset = Vector2.ZERO
		
func shake(amount: float):
	shake_strength = max(shake_strength, amount)
