extends TextureProgressBar

@export var entity: CharacterBody2D


func _ready() -> void:
	if entity:
		max_value = entity.max_health
		value = entity.health
		entity.health_changed.connect(_on_health_changed)
		

func _on_health_changed(current_health):
	max_value = entity.max_health
	value =  current_health
