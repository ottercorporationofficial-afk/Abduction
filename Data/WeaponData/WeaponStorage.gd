extends Node

## Cross Hair Textures 
const GUN = preload("uid://bilhv31h6ifl7")
const TRACTOR_BEAM = preload("uid://cr387kd3ovln0")


var data: Array[Weapon] = [
	Weapon.new({
		"id": "gun",
		"name": "gun",		
		"cross_hair_texture": GUN,
		"unlocked": true,
		"damage" : 1
		
		}),
	Weapon.new({
		"id": "tractor_beam",
		"name": "tractor beam",
		"cross_hair_texture": TRACTOR_BEAM,
		"unlocked": true,
		"damage" : 0
	})
		
	]
