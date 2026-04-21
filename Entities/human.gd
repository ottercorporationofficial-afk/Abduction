extends CharacterBody2D

@export var damage_number_scene: PackedScene


@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit: AudioStreamPlayer2D = $Hit
@onready var animation_player: AnimationPlayer = $AnimationPlayer

enum State { IDLE, WALK }

var is_dead := false

var state = State.IDLE

var speed := 25.0
var direction := Vector2.ZERO
var facing := Vector2.RIGHT

var grid_size := Vector2i(20, 10)
var tile_size := Vector2(32, 32)
var map_size := Vector2(grid_size) * tile_size # grid_size * tile_ size



var max_health : int
var health : int 

signal health_changed(amount)

func _ready() -> void:
	max_health = 10
	health = max_health
	
	
	## prevents hits from flashing on all humans
	if animation.material:
		animation.material = animation.material.duplicate()
	_next_state()
	
## Random Walking

func _process(delta):
	if is_dead:
		return
		
	match state:
		State.WALK:
			position += direction * speed * delta
			_handle_bounds()
	update_animation()

func _handle_bounds():
	if position.x <= 0 or position.x >= map_size.x:
		direction.x *= -1
	if position.y <= 0 or position.y >= map_size.y:
		direction.y *= -1
		
	position = position.clamp(Vector2.ZERO,map_size)

func _next_state():
	if is_dead:
		return
	
	if randf() < 0.5:
		state = State.IDLE
		direction = Vector2.ZERO
		
		var wait_time = randf_range(0.5, 2.5)
		await get_tree().create_timer(wait_time).timeout
		
		_next_state()
	else:
		state = State.WALK
		
		set_direction(Vector2(
			randf_range(-1,1),
			randf_range(-1,1)
		))
		
		var walk_time = randf_range(1.0, 4.0)
		await get_tree().create_timer(walk_time).timeout
		
		_next_state()

func is_turning(new_dir: Vector2) -> bool:
	if new_dir == Vector2.ZERO:
		return false
	return facing.dot(new_dir) < 0.3

func update_animation():
	if direction.length() < 0.1 or state == State.IDLE:
		if animation.animation != "idle":
			animation.play("idle")
	else:
		if animation.animation != "walk":
			animation.play("walk")
			
func set_direction(new_dir: Vector2):
	if new_dir == Vector2.ZERO:
		return
	
	new_dir = new_dir.normalized()
	
	direction = new_dir
	facing = new_dir
	animation.flip_h = facing.x < 0

func take_damage(amount):
	health -= amount
	health_changed.emit(health)
	hit.play()
	
	if health <= 0:
		die()
		
	var dmg = damage_number_scene.instantiate()
	dmg.global_position = global_position
	get_tree().current_scene.add_child(dmg)
	dmg.setup(amount, false)


func die():
	if is_dead:
		return
		
	is_dead = true
	
	state = State.IDLE
	direction = Vector2.ZERO
	
	animation_player.play("Downed")
	
	

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
