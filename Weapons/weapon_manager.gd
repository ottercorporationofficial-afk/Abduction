class_name weapons_manager
extends Node2D

var weapons: Array[Weapon] = []
var current_index: int = 0 


@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var cross_hair: Node2D = $"../CrossHair"
@onready var selected_weapon: RichTextLabel = $"../CanvasLayer/StatusBar/SelectedWeapon"


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
	
	selected_weapon.text = weapon.name
	TweenFX.pop_in(selected_weapon)
	await get_tree().create_timer(1).timeout
	TweenFX.pop_out(selected_weapon)
	
	
	
	
func next_weapon():
	if weapons.is_empty():
		return
		
	current_index = (current_index + 1) % weapons.size()
	_update_weapon()

func _input(event: InputEvent) -> void:
	if MouseBlocker.is_mouse_locked():
		return

	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			shoot()
			camera_2d.shake(2.0)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_select_next()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_select_previous()

func _select_next():
	current_index = (current_index + 1) % weapons.size()
	_update_weapon()


func _select_previous():
	current_index = (current_index - 1 + weapons.size()) % weapons.size()
	_update_weapon()



func shoot():
	var weapon = weapons[current_index]
	
	var mouse_pos = get_global_mouse_position()
	
	
	Weaponbehavior._handle_weapon(mouse_pos,weapon)
		

	
