extends Node2D

@export var texture: Texture2D
@onready var crosshair: Sprite2D = $Crosshair


func _ready() -> void:
	if texture:
		crosshair.texture = texture


func _process(delta: float) -> void:
	position = get_global_mouse_position()
