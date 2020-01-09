extends Node

const SECTOR_SIZE = 128
const COLOR_WHITE = Color(1, 1, 1, 1)
const COLOR_RED = Color(1, 0, 0, 1)
const COLOR_GREEN = Color(0, 1, 0, 1)
const COLOR_BLUE = Color(0, 0, 1, 1)
const COLOR_YELLOW = Color(1, 1, 0, 1)
const COLOR_TRANSPARENT = Color(1, 1, 1, 0)
const COLOR_FOGOFWAR = Color(0.5, 0.5, 0.5, 1.0)	# цвет "тумана войны". Использется как маска цвета для шейдера. Должен быть уникальным и нигде больше не использоваться

enum OBJECT_TYPE {UNKNOWN, PLAYER}

onready var main_node = get_tree().current_scene
onready var gui: GUI = main_node.get_node("GUI")
onready var world: GameWorld = main_node.get_node("World")
onready var running_arrows = world.find_node("RunningArrows")