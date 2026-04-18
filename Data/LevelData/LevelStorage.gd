extends Node

var data: Array[Level] = [
	Level.new({
		"id": "forest",
		"name": "Forest",
		"cost": 0,
		"grid_size": Vector2i(20, 10),
		"beings" : ["Human"],
		"being_amount" : 2
	}),
	Level.new({
		"id": "desert",
		"name": "Desert",
		"cost": 100,
		"grid_size": Vector2i(5, 5),
		"beings" : ["Human"],
		"being_amount" : 2
	})
]

var data_dict: Dictionary

func _ready() -> void:
	for level: Level in data:
		data_dict[level.id] = level

func search(id: String) -> Level:
	return data_dict.get(id,null)
