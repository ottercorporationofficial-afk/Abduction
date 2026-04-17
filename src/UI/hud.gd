extends CanvasLayer


@onready var level_selector_scene = preload("uid://l711wtrb1h81")


func _on_abduct_pressed() -> void:
	Globals.popups.popup_scn(level_selector_scene)
