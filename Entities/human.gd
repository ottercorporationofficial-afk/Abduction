extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit: AudioStreamPlayer2D = $Hit

var max_health : int
var health : int 

signal health_changed(amount)

func _ready() -> void:
	max_health = 10
	health = max_health
	
	
	## prevents hits from flashing on all humans
	if animation.material:
		animation.material = animation.material.duplicate()




func _on_click_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		flash_hit()
		TweenFX.shake(self)
		take_damage(1)

var  x = 0 

func take_damage(amount):
	x += 1 
	print("hit" + str(x) + "times" )
	health -= amount
	health_changed.emit(health)
	if health <= 0:
		die()

func die():
	TweenFX.fade_out(self)

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
