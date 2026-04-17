class_name Level
extends RefCounted

var id : String 
var name: String 
var texture: Texture2D
var cost: int


func _init(data: Dictionary = {}) -> void:
	if data.is_empty(): return
	id = data.id 
	name = data.name 
	texture = load("res://Art/Levels/%s.png" % id)
	cost = data.cost 
	
	
