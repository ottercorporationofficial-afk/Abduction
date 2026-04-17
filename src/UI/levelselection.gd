class_name level_selector
extends SimplePopup


@onready var vbox: VBoxContainer = $PanelContainer/MarginContainer/ScrollContainer/VBoxContainer
@onready var grid: GridContainer = $PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/GridContainer


func _ready() -> void:
	var levels: Array = LevelStorage.data.duplicate()
	
	for i in range(GameState.unlocked_levels):
		var level:  Level = levels[i]
		_add_level(level)
		
		
const LEVEL_BUTTON_SCENE = preload("res://src/UI/level_button.tscn")


func _add_level(level):
	var level_button = LEVEL_BUTTON_SCENE.instantiate()
	grid.add_child(level_button)
	level_button.setup(level)
