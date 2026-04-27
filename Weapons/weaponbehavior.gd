class_name Weapon_Behavior
extends Node2D


func _handle_weapon(origin: Vector2, weapon: Weapon):
	match weapon.id:
		"gun":
			return _shoot_gun(origin,weapon)
		"tractor_beam":
			return _shoot_beam(origin,weapon)
			
			
			
func _shoot_gun(origin: Vector2, weapon: Weapon):
	var space_state = get_world_2d().direct_space_state
	
	var query = PhysicsPointQueryParameters2D.new()
	query.position = origin
	query.collide_with_areas = true
	query.collide_with_bodies = true
	
	var results = space_state.intersect_point(query)

	for hit in results:
		var collider = hit.collider
		
		if collider.has_method("take_damage"):
			
			if collider.has_method("is_alive") and not collider.is_alive():
				continue
			
			collider.take_damage(weapon.damage)
			return true
			
	return false
			
func _shoot_beam(origin: Vector2,weapon : Weapon):
	var space_state = get_world_2d().direct_space_state
	
	var query = PhysicsPointQueryParameters2D.new()
	query.position = origin
	query.collide_with_areas = true
	query.collide_with_bodies = true
	
	var results = space_state.intersect_point(query)

	for hit in results:
		var collider = hit.collider
		
		if collider.has_method("abduct"):
			collider.abduct()
	return false
