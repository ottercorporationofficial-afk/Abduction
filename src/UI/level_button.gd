class_name Level_Selection
extends PanelContainer


@onready var label: RichTextLabel = $Button/VBoxContainer/Label
@onready var level_image: TextureRect = $Button/VBoxContainer/LevelImage

var level = Level
var is_locked: bool = false

var popup_ref



func setup(level_data: Level):
	if level_data == null:
		push_error("Level data is null!")
		return
	level = level_data
	level_image.texture = level.icon
	label.text = level.name
	
 


func _on_button_pressed() -> void:
	SceneManager.load_level(level)
	Globals.popups.remove_popup(popup_ref)
