extends Node

const HUMAN = preload("uid://ga6sxr7qdr31")


var data: Array[Being] = [
	Being.new({
		"id": "Human",
		"name": "Human",
		"scene": HUMAN,
	}),
	]
	
func get_being(id: String) -> Being:
	for b in data:
		if b.id == id:
			return b
	return null 
