extends Node

var container: Node
var current_scene: Node

func set_container(node: Node):
	container = node
	
func load_scene(path: String):
	if current_scene:
		current_scene.queue_free()
	current_scene = load(path).instantiate()
	container.add_child(current_scene)
	
	
## loads in main game loop abduction level 
func load_level(level: Level):
	if current_scene:
		current_scene.queue_free()
	
	current_scene = preload("uid://doaemvmp85wic").instantiate() ## preloads abduction scene 
	container.add_child(current_scene)
	
	current_scene.setup(level)
