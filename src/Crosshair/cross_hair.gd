extends Node2D

@export var textures : Array[Texture2D]
@onready var crosshair: Sprite2D = $Crosshair


 
func _process(delta: float) -> void:
	position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			shoot()
func change_texture(_texture : Texture2D):
	crosshair.texture = _texture
	
func shoot():
	var space_state = get_world_2d().direct_space_state
	
	var query = PhysicsPointQueryParameters2D.new()
	query.position = global_position  # crosshair position
	query.collide_with_areas = true
	query.collide_with_bodies = true
	query.collision_mask = 0xFFFFFFFF

	var results = space_state.intersect_point(query)

	print(results)

	for hit in results:
		var collider = hit.collider
		
		if collider.has_method("take_damage"):
			collider.take_damage(1)
