extends Node

var data: Array[Level] = [
	Level.new({
		"id": "forest",
		"name": "Forest",
		"cost": 0
	}),
	Level.new({
		"id": "desert",
		"name": "Desert",
		"cost": 100
	})
]

var data_dict: Dictionary

func _ready() -> void:
	for level: Level in data:
		data_dict[level.id] = level

func search(id: String) -> Level:
	return data_dict.get(id,null)
