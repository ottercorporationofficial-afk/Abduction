class_name Weapon
extends RefCounted

var id : String 
var name: String 
var cross_hair_texture: Texture2D
var unlocked : bool = false
var damage : int = 1 


func _init(data: Dictionary = {}) -> void:
	if data.is_empty(): return
	id = data.id 
	name = data.name 
	cross_hair_texture = data.cross_hair_texture
	unlocked = data.unlocked
	damage = data.damage  
	
	
	
 
