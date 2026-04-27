extends CanvasLayer

var mouse_blocker: Control

var mouse_locks: Dictionary = {}

func _ready() -> void:
	layer = 8
	mouse_blocker = Control.new()
	add_child(mouse_blocker)
	mouse_blocker.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_blocker.offset_left = -100
	mouse_blocker.offset_right = 100
	mouse_blocker.offset_top = -100
	mouse_blocker.offset_bottom = 100
	mouse_blocker.mouse_filter = Control.MOUSE_FILTER_STOP
	mouse_blocker.hide()

func lock_mouse(holder) -> void:
	mouse_locks[holder] = true
	mouse_blocker.show()
func unlock_mouse(holder) -> void:
	mouse_locks.erase(holder)
	mouse_blocker.visible = not mouse_locks.is_empty()
func is_mouse_locked() -> bool:
	return not mouse_locks.is_empty()
