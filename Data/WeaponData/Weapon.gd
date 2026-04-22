class_name Weapon
extends RefCounted

var id : String 
var name: String 
var texture: Texture2D


func _init(data: Dictionary = {}) -> void:
	if data.is_empty(): return
	id = data.id 
	name = data.name 
	texture = load("res://Art/CrossHair/%s.png" % id)
	
	
	
 
