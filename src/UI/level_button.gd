extends Panel


@onready var label: RichTextLabel = $Label
@onready var level_image: TextureRect = $LevelImage


func setup(level):
	if level == null:
		push_error("Level data is null!")
		return
	level_image.texture = level.texture
	label.text = level.name
	
 
