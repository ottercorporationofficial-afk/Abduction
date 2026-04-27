class_name Level_Complete
extends SimplePopup

@onready var progress_bar: ProgressBar = $PanelContainer/MarginContainer/VBoxContainer/GridContainer/ProgressBar

var being_abducted_amount : int 
var being_amount : int


func _ready() -> void:
	being_abducted_amount = 0
	being_amount = 0 

func setup(_being_abducted_amount: int, _being_amount: int):
	being_abducted_amount = _being_abducted_amount
	being_amount = _being_amount
	
	progress_bar.value = being_abducted_amount
	progress_bar.max_value = being_amount

func _on_button_pressed() -> void:
	SceneManager.load_scene("uid://bvwm15ty43e7m") # Menargerie
	Globals.popups.remove_popup(self)
