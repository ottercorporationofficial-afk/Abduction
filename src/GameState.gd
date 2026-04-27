extends Node

var unlocked_levels : int 


var beings_captured : Dictionary

## resets game state 
func reset():
	beings_captured = {}
	### change this to 1 later , 2 is for testing 
	unlocked_levels = 2 

func _ready() -> void:
	unlocked_levels = 2
	EventBus.abducted.connect(_on_being_abducted)
	
func add_being(being_name: String):
	if beings_captured.has(being_name):
		beings_captured[being_name] + 1
	else: 
		beings_captured[being_name] = 1 
		
	
func _on_being_abducted(being_data: Being):
	add_being(being_data.name)
