extends Control

@onready var label: RichTextLabel = $label

var time_left: float = 60.0 # starting time
var running: bool = false 

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


func format_time(t: float) -> String:
	var seconds = int(t)
	var centiseconds = int((t - seconds) * 100)
	
	return "%02d:%02d" % [seconds, centiseconds]
