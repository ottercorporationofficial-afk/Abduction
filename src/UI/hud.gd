extends CanvasLayer


@onready var level_selector_scene = preload("uid://l711wtrb1h81")
@onready var upgrade_scene = preload("uid://bq3585i01p1ao")


func _on_abduct_pressed() -> void:
	var popup = level_selector_scene.instantiate()
	
	Globals.popups.add_popup(popup)


func _on_upgrade_pressed() -> void:
	var popup = upgrade_scene.instantiate()
	
	Globals.popups.add_popup(popup)
