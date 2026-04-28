extends Control

@onready var label: RichTextLabel = $RichTextLabel

func setup(being: Being):
	label.text = being.name
	
