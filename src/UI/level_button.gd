extends Panel


@onready var label: RichTextLabel = $Label

var level_data

func setup(level):
	level_data = level
