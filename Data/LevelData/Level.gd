class_name Level
extends RefCounted

var id : String 
var name: String 
var texture: Texture2D
var cost: int
var grid_size: Vector2i 


func _init(data: Dictionary = {}) -> void:
	if data.is_empty(): return
	id = data.id 
	name = data.name 
	texture = load("res://Art/Levels/Icons/%s.png" % id)
	cost = data.cost 
	grid_size = data.grid_size
	
	
 
