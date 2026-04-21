class_name popup_manager
extends Control

@onready var darken: ColorRect = $Darken
@onready var blocker: Control = $Blocker
 
var stack: Array[Control] = []

func _ready():
	Globals.popups = self

func has_popup() ->  bool:
	return not stack.is_empty()
	

func add_popup(popup) -> void:
	popup.z_index = 100 
	# Reparent Safely
	if popup.get_parent():
		popup.get_parent().remove_child(popup)

	add_child(popup)
	stack.append(popup)
	
	blocker.show()
	move_child(blocker, get_child_count() - 2) # just below popup
	move_child(popup, get_child_count() - 1)   # top	
	
	
	
	darken.show()
	
	
	
 	
	
		
func remove_popup(popup: Control) -> void:
	if popup in stack:
		stack.erase(popup)

	if popup.get_parent() == self:
		remove_child(popup)

	#InputBlocker.unlock(popup)

	if stack.is_empty():
		blocker.hide()
		darken.hide()
	else:
		var top = stack.back()
		move_child(blocker, top.get_index())
	
func darken_screen():
	darken.show()
	
