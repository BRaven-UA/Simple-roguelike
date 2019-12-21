extends CanvasLayer

class_name GameWorld	# объявлен глобальный класс для удобства работы в редакторе кода

var sector_current: WorldSector setget _set_sector_current	# ссылка на текущий сектор, в которым на данный момент находится игрок
var sector_mouseover: WorldSector	# ссылка на сектор, над которым в данный момент курсор мыши
var free_look := false	# флаг свободной камеры

func _set_sector_current(new_value):
	if sector_current:	# на случай null
		sector_current.background.color = Global.COLOR_TRANSPARENT
	sector_current = new_value
	sector_current.background.color = Global.COLOR_GREEN

func _ready() -> void:
	self.sector_current = get_node("Sectors").get_child(1 + randi() % get_child_count())	# временно

func _input(event):
	if event.is_action_pressed("camera_free"):
		free_look = not free_look
#		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) if free_look else Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event.is_action_pressed("camera_reset"):
		offset = Vector2.ZERO	# сброс смещения вьюпорта
	
	if event is InputEventMouseMotion and free_look:
		offset += event.relative	# смещаем вьюпорт на дельту смещения мыши от предыдущей ее позиции
