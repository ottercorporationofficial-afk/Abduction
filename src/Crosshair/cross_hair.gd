extends Node2D

@export var textures : Array[Texture2D]
@onready var crosshair: Sprite2D = $Crosshair

 
func _process(delta: float) -> void:
	position = get_global_mouse_position()


func change_texture(_texture : Texture2D):
	crosshair.texture = _texture
	
