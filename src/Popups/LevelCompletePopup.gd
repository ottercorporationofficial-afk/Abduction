class_name Level_Complete
extends SimplePopup


func _on_button_pressed() -> void:
	Globals.popups.remove_popup(self)
