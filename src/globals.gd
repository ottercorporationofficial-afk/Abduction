extends Node

var popups: popup_manager


func flash_text(label: RichTextLabel,duration := 2.0):
	
	label.modulate.a = 0.0
	label.visible = true

	var tween = create_tween()

	# Fade in
	tween.tween_property(label, "modulate:a", 1.0, 0.3)

	# Wait (stay visible)
	tween.tween_interval(duration)

	# Fade out
	tween.tween_property(label, "modulate:a", 0.0, 0.5)

	# Hide at end (optional)
	tween.tween_callback(func(): label.visible = false)
	
