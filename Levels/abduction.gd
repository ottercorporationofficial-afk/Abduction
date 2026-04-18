class_name abduction_scene
extends Node2D

@onready var tile_scene = preload("uid://bi823t1sdslcb")
@onready var grid: Node2D = $Grid

var level_data : Level
var tiles = []

var grid_size = Vector2i(0, 0)
var tile_size = Vector2(32, 32)

func setup(level):
	level_data = level 
	
	grid_size = level_data.grid_size

	for x in range(grid_size.x):
		tiles.append([])
		
		for y in range(grid_size.y):
			var tile = tile_scene.instantiate()
			
			tile.position = Vector2(tile_size.x * x, tile_size.y * y)
			
			grid.add_child(tile) 
			tiles[x].append(tile)

	var screen_size = get_viewport_rect().size
	var grid_pixel_size = Vector2(grid_size) * tile_size

	grid.position = (screen_size - grid_pixel_size) / 2
