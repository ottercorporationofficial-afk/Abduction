extends Node2D
@onready var scene_holder: Node2D = $SceneHolder

func _ready() -> void:
	SceneManager.set_container(scene_holder) 
	SceneManager.load_scene("uid://bvwm15ty43e7m")	
	
	

func _unhandled_input(event):
	if InputBlocker.is_blocked():
		get_viewport().set_input_as_handled()
		return
 
