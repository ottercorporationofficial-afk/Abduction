extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit: AudioStreamPlayer2D = $Hit


func _ready() -> void:
	
	## prevents hits from flashing on all humans
	if animation.material:
		animation.material = animation.material.duplicate()




func _on_click_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		flash_hit()
		TweenFX.shake(self)




func flash_hit():
	if animation.material == null:
		return
	
	animation.material.set_shader_parameter("flash_color", Vector3(1.0, 1.0, 1.0))
	animation.material.set_shader_parameter("flash_strength", 0.8)
	hit.play()
	
	var tween = create_tween()
	tween.tween_method(
		func(v):
			animation.material.set_shader_parameter("flash_strength", v),
		animation.material.get_shader_parameter("flash_strength"),
		0.0,
		0.12
	)
