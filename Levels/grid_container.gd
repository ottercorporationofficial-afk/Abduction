extends GridContainer

const BEING_CONTAINER_CONTROL = preload("uid://df2ncgx35rcnf")

func _ready() -> void:
	for being in GameState.beings_captured:
		var container = BEING_CONTAINER_CONTROL.instantiate()
		add_child(container)

		var viewport = container.get_node("TextureRect/SubViewportContainer/SubViewport")

		var being_instance = BeingData.get_being(being).scene.instantiate()
		being_instance.is_captured = true

		viewport.add_child(being_instance)

		# Wait one frame so viewport has correct size
		await get_tree().process_frame

		being_instance.position = viewport.size / 2
