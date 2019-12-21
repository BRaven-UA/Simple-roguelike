extends Node

const SECTOR_SIZE = 128
const COLOR_WHITE = Color(1, 1, 1, 1)
const COLOR_RED = Color(1, 0, 0, 1)
const COLOR_GREEN = Color(0, 1, 0, 1)
const COLOR_BLUE = Color(0, 0, 1, 1)
const COLOR_TRANSPARENT = Color(1, 1, 1, 0)
onready var main_node = get_tree().current_scene
onready var gui = main_node.get_node("GUI")
onready var world: GameWorld = main_node.get_node("World")
