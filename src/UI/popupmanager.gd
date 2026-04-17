class_name popup_manager
extends Control



var stack: Array[Control] = []

func _ready():
	Globals.popups = self

func has_popup() ->  bool:
	return not stack.is_empty()
	

func popup_scn(scene):
	var instance = scene.instantiate()
	add_child(instance)
	
	if instance is Popup:
		instance.popup_centered()
	
func add_popup(popup: Control) -> void:
	stack.append(popup)
	add_child(popup)
	
