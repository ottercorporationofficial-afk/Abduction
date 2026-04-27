class_name abduction_scene
extends Node2D


## Information Setup 
@onready var beings_captured: RichTextLabel = $CanvasLayer/StatusBar/BeingsCaptured/BeingsCaptured


## Tile/map setup
@onready var tile_scene = preload("uid://bi823t1sdslcb") ## default grass tile
@onready var grid: Node2D = $Grid

## Level Information 
var being_amount : int 
var beings : Array
var beings_abducted_amount := 0 


var level_data : Level
var tiles = []

var grid_size = Vector2i(0, 0)
var tile_size = Vector2(32, 32)



@onready var weapon_manager: weapons_manager = $WeaponManager


func _ready() -> void:
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	weapon_manager.setup(WeaponStorage.data)
	EventBus.abducted.connect(_on_being_abducted)

	
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
	
	beings_captured.text = str(beings_abducted_amount) + "/" + str(being_amount)
	
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
		
		# setup
		if being.has_method("setup"):
			being.setup(being_data)
		
		# random tile
		var x = randi() % grid_size.x 
		var y = randi() % grid_size.y
		
		being.position = Vector2(x * tile_size.x, y * tile_size.y)
		
		grid.add_child(being)
		
		
		
func _on_being_abducted(being_data: Being):
	beings_abducted_amount += 1 
	beings_captured.text = str(beings_abducted_amount) + "/" + str(being_amount)
	

 
