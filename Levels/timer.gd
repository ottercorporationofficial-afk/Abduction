extends Control

@onready var label: RichTextLabel = $label
@onready var popup_manager: popup_manager = $"../../../popup_manager"
const LEVEL_COMPLETE_POPUP = preload("uid://bsy763ic4lp8d")

var time_left: float = 5.0 # starting time
var running: bool = true 

signal finished


func _process(delta):
	label.text = "Time Left: " + format_time(time_left)
	if not running:
		return
	
	if time_left > 0:
		time_left -= delta
		time_left = max(time_left, 0)
		label.text = "Time Left: " + format_time(time_left)
	else:
		running = false
		emit_signal("finished")
		print("TIME UP")
		var popup = LEVEL_COMPLETE_POPUP.instantiate()
	
		Globals.popups.add_popup(popup)



func format_time(t: float) -> String:
	var seconds = int(t)
	var centiseconds = int((t - seconds) * 100)
	
	return "%02d:%02d" % [seconds, centiseconds]
