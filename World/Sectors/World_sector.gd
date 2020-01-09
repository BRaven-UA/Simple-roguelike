extends Control

class_name WorldSector

onready var world = Global.world
onready var background: ColorRect = find_node("Background")	# фон сектора
onready var frame: NinePatchRect = find_node("Frame")	# рамка сектора
onready var content: GridContainer = find_node("Content")	# сюда складываются объекты данного сектора
onready var fog: ColorRect = find_node("Fog")	# верхний слой сектора - тумайн войны или другий постэффект
onready var rect_center = rect_position + rect_size / 2	# координаты центра данного узла

func _ready() -> void:
	rect_size = Vector2(Global.SECTOR_SIZE, Global.SECTOR_SIZE)
	fog.visible = true	# в редакторе отключен чтобы не мешал обзору

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if world.sector_mouseover != self:
			if world.sector_mouseover:	# для случая null
				world.sector_mouseover.frame.self_modulate = Global.COLOR_WHITE
			world.sector_mouseover = self
			frame.self_modulate = Global.COLOR_GREEN
			Global.running_arrows.point_at(self)
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			world.sector_selected = self