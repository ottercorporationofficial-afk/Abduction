class_name Level
extends RefCounted

var id : String 
var name: String 
var icon: Texture2D
var cost: int
var grid_size: Vector2i 
var tile : Texture2D


###
var being_amount : int ## amount of beings to be spawned 
var beings : Array


func _init(data: Dictionary = {}) -> void:
	if data.is_empty(): return
	id = data.id 
	name = data.name 
	icon = load("res://Art/Levels/Icons/%s.png" % id)
	tile = data.tile 
	cost = data.cost
	being_amount = data.being_amount 
	beings = data.beings 
	grid_size = data.grid_size
	
	
 
