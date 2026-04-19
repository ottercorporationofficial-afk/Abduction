extends Control


@onready var texture_rect: TextureRect = $TextureRect

var tile : Texture2D

func _ready() -> void:
	if tile:
		texture_rect.texture = tile
