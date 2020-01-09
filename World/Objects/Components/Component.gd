extends Node

class_name Component

var parent: WorldObject

func _enter_tree() -> void:
	parent = get_parent()