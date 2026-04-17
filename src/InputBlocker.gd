extends Node
class_name Input_Blocker

var locks: Dictionary = {}

func lock(holder):
	locks[holder] = true
	
func unlock(holder):
	locks.erase(holder)
	
func is_blocked() -> bool:
	return not locks.is_empty()
