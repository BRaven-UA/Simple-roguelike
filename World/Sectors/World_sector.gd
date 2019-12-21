extends Control

class_name WorldSector

onready var world = Global.world
onready var background = find_node("Background")	# фон сектора
onready var frame = find_node("Frame")	# рамка сектора
onready var content = find_node("Content")	# сюда складываются объекты данного сектора


func _ready() -> void:
	rect_size = Vector2(Global.SECTOR_SIZE, Global.SECTOR_SIZE)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if world.sector_mouseover != self:
			if world.sector_mouseover:	# для случая null
				world.sector_mouseover.frame.self_modulate = Global.COLOR_WHITE
			world.sector_mouseover = self
			frame.self_modulate = Global.COLOR_GREEN
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			world.sector_current = self
