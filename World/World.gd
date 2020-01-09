extends CanvasLayer

class_name GameWorld	# объявлен глобальный класс для удобства работы в редакторе кода

onready var sectors = get_node("Sectors")	# ссылка на родительский узел секторов
var player	# ссылка на объект, управляемый игроком
var sector_current: WorldSector setget _set_sector_current	# ссылка на текущий сектор, в которым на данный момент находится игрок
var sector_selected: WorldSector setget _set_sector_selected	# ссылка на выбранный (но не текущий) сектор
var sector_mouseover: WorldSector	# ссылка на сектор, над которым в данный момент курсор мыши
var free_look := false	# флаг свободной камеры

func _set_sector_current(new_value):
	if sector_current:	# на случай null
		sector_current.background.color = Global.COLOR_TRANSPARENT
	sector_current = new_value
	sector_current.background.color = Global.COLOR_GREEN	# меняем цвет подложки
	sector_current.fog.color = Global.COLOR_TRANSPARENT	# убираем "туман войны"
	relocate_object(player, sector_current)	# перемещаем игрока

func _set_sector_selected(new_value):
	if sector_selected and sector_selected != sector_current:	# на случай null
		sector_selected.background.color = Global.COLOR_TRANSPARENT
	sector_selected = new_value
	sector_selected.background.color = Global.COLOR_YELLOW

func _ready() -> void:
#	self.sector_current = sectors.get_child(1 + randi() % get_child_count())	# временно
	self.sector_current = sectors.get_node("Sector41")	# временно

func _input(event):
	if event.is_action_pressed("camera_free"):
		free_look = true
#		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) if free_look else Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_released("camera_free"):
		free_look = false
	
	if event.is_action_pressed("camera_reset"):
		offset = Vector2.ZERO	# сброс смещения вьюпорта
	
	if event is InputEventMouseMotion and free_look:
		offset += event.relative	# смещаем вьюпорт на дельту смещения мыши от предыдущей ее позиции

func relocate_object(object: WorldObject, new_sector: WorldSector):	# перемещение объекта в другой сектор
	assert(object and new_sector)
	object.get_parent().remove_child(object)
	new_sector.content.add_child(object)