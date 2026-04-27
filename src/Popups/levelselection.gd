class_name level_selector
extends SimplePopup


@onready var vbox: VBoxContainer = $PanelContainer/MarginContainer/ScrollContainer/VBoxContainer
@onready var grid: GridContainer = $PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/GridContainer


var popup_ref

func _ready() -> void:
	popup_ref = self
	
	var levels: Array = LevelStorage.data.duplicate()
	
	for i in range(GameState.unlocked_levels):
		var level:  Level = levels[i]
		_add_level(level)
		
		
const LEVEL_BUTTON_SCENE = preload("res://src/UI/level_button.tscn")


func _add_level(level):
	var level_button = LEVEL_BUTTON_SCENE.instantiate()
	
	grid.add_child(level_button)
	
	level_button.popup_ref = popup_ref
	
	level_button.setup(level)


func _on_button_pressed() -> void:
	Globals.popups.remove_popup(self)
	
	

 
