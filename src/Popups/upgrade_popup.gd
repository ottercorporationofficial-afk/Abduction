class_name UpgradePopup
extends SimplePopup


func _on_button_pressed() -> void:
	Globals.popups.remove_popup(self)
