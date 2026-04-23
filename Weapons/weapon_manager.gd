class_name weapons_manager
extends Node2D

var weapons: Array[Weapon] = []
var current_index: int = 0 


@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var cross_hair: Node2D = $"../CrossHair"
 

func setup(weapon_data: Array[Weapon]) -> void:
	## Store Weapons
	weapons = weapon_data
	
	## filter for only unlocked weapons
	weapons = weapons.filter(func(w): return w.unlocked)
	
	# check if any weapons
	if weapons.is_empty():
		push_error("No weapons available!")
		return
	# Set default weapon
	current_index = 0
	_update_weapon()

func _update_weapon():
	var weapon = weapons[current_index]
	
	# set crosshair texture
	if weapon.cross_hair_texture:
		cross_hair.change_texture(weapon.cross_hair_texture)
	
	print("Equipped:", weapon.name)
	
	
	
func next_weapon():
	if weapons.is_empty():
		return
		
	current_index = (current_index + 1) % weapons.size()
	_update_weapon()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			shoot()
			camera_2d.shake(2.0)



func shoot():
	var weapon = weapons[current_index]
	
	var mouse_pos = get_global_mouse_position()
	
	match weapon.id:
		"gun":
			Weaponbehavior._shoot_gun(mouse_pos,weapon)
		"tractor_beam":
			Weaponbehavior._shoot_beam(weapon)

func abduct():
	pass
	
	
