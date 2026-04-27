class_name popup_manager
extends Control

@onready var darken: ColorRect = $Darken

var stack: Array[Control] = []

func _ready():
	Globals.popups = self
	
	darken.mouse_filter = Control.MOUSE_FILTER_IGNORE
	darken.hide()


func has_popup() -> bool:
	return not stack.is_empty()


func add_popup(popup: Control) -> void:
	popup.z_index = 101
	
	# Reparent safely
	if popup.get_parent():
		popup.get_parent().remove_child(popup)
	
	add_child(popup)
	stack.append(popup)

	_update_layout()


func remove_popup(popup: Control) -> void:
	if popup in stack:
		stack.erase(popup)

	if popup.get_parent() == self:
		popup.queue_free()

	_update_layout()


func _update_layout():
	if stack.is_empty():
		MouseBlocker.unlock_mouse(self)
		darken.hide()
		return

	MouseBlocker.lock_mouse(self)
	darken.show()

	var top_popup = stack.back()

	# Ensure correct draw order
	move_child(darken, get_child_count() - 2)
	move_child(top_popup, get_child_count() - 1)
