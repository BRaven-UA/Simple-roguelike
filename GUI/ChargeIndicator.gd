# узел для отображения состояния электрической энергии игрока. Высота индикатора меняется в зависимости от максимального уровня энергии
extends Control

class_name ChargeIndicator

onready var _background: NinePatchRect = find_node("Background")	# ссылка на фоновое изображение
onready var _progress: ProgressBar = find_node("Progress")	# ссылка на шкалу заполнения
onready var _min_height: float = _background.rect_size.y - _progress.rect_size.y	# минимальная высота индикактора

var capacity: int setget _set_capacity	# максимальный уровень энергии
func _set_capacity(new_value):
	capacity = int(max(0, new_value))	# отсекаем отрицательные значения
	self.value = value	# обновляем текущий уровень
	_background.margin_top = -(_min_height + capacity)	# изменяем размер индикатора исходя из максимального уровня
	_progress.max_value = capacity
	visible = capacity	# отображать индикатор при ненулевых значениях

var value: int setget _set_value	# текущий уровень энергии
func _set_value(new_value):
	value = int(clamp(new_value, 0, capacity))	# ограничиваем значение в диапазоне от 0 до максимального уровня
	_progress.value = value