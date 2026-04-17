extends CanvasLayer


@onready var level_selector_scene = preload("uid://l711wtrb1h81")


func _on_abduct_pressed() -> void:
	var popup = level_selector_scene.instantiate()
	
	Globals.popups.add_popup(popup)
