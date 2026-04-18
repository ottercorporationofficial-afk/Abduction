class_name Being
extends RefCounted


var id : String
var name: String 
var scene : PackedScene


func _init(data: Dictionary) -> void:
	if data.is_empty(): return
	id = data.id 
	name = data.name 
	scene = data.scene 
	
