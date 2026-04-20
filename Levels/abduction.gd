class_name abduction_scene
extends Node2D


## Information Setup 
@onready var beings_captured: RichTextLabel = $CanvasLayer/StatusBar/BeingsCaptured/BeingsCaptured


## Tile/map setup
@onready var tile_scene = preload("uid://bi823t1sdslcb")
@onready var grid: Node2D = $Grid

## Level Information 
var being_amount : int 
var beings : Array


var level_data : Level
var tiles = []

var grid_size = Vector2i(0, 0)
var tile_size = Vector2(32, 32)

var weapons := ["gun", "tractor_beam"]
var current_index := 0

@onready var selected_weapon: RichTextLabel = $CanvasLayer/StatusBar/SelectedWeapon


@onready var cross_hair: Node2D = $CrossHair


func _ready() -> void:
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	_update_weapon()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_select_next()

		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_select_previous()

func _select_next():
	current_index = (current_index + 1) % weapons.size()
	_update_weapon()


func _select_previous():
	current_index = (current_index - 1 + weapons.size()) % weapons.size()
	_update_weapon()


func _update_weapon():
	var weapon = weapons[current_index]
	print("Selected:", weapon)
	selected_weapon.text = weapon 
	Globals.flash_text(selected_weapon,1)
	
	if weapon == "gun":
		cross_hair.change_texture(cross_hair.textures[0])
	else:
		cross_hair.change_texture(cross_hair.textures[1])
 	
func setup(level):
	level_data = level 
	being_amount = level_data.being_amount
	beings = level_data.beings
	
	grid_size = level_data.grid_size

	for x in range(grid_size.x):
		tiles.append([])
		
		for y in range(grid_size.y):
			var tile = tile_scene.instantiate()
			tile.tile = level_data.tile
			
			tile.position = Vector2(tile_size.x * x, tile_size.y * y)
			
			grid.add_child(tile) 
			tiles[x].append(tile)

	var screen_size = get_viewport_rect().size
	var grid_pixel_size = Vector2(grid_size) * tile_size

	grid.position = (screen_size - grid_pixel_size) / 2
	
	beings_captured.text = "0/" + str(being_amount)
	
	spawn_beings()  
	
func spawn_beings():
	for i in range(being_amount):
		
		# pick a random type from allowed pool
		var id = beings.pick_random()
		
		var being_data = BeingData.get_being(id)
		
		if being_data == null:
			push_error("Invalid being id: " + str(id))
			continue
		
		var being = being_data.scene.instantiate()
		
		# optional setup
		if being.has_method("setup"):
			being.setup(being_data)
		
		# random tile
		var x = randi() % grid_size.x 
		var y = randi() % grid_size.y
		
		being.position = Vector2(x * tile_size.x, y * tile_size.y)
		
		grid.add_child(being)
		
		
		
 

 
