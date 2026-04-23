class_name Weapon_Behavior
extends Node2D

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
			collider.take_damage(weapon.damage)
			
			
func _shoot_beam(weapon : Weapon):
	pass
