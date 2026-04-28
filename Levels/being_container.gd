extends Node2D

@onready var human: CharacterBody2D = $Human

func _ready() -> void:
	human.is_captured = true


func _on_tap_box_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		pass
