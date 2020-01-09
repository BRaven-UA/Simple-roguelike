# компонент для управления электрической энергией объекта
extends Component

var capacity: int setget _set_capacity	# максимальный уровень энергии
func _set_capacity(new_value):
	capacity = new_value
	if parent.is_player:
		Global.gui.charge_indicator.capacity = capacity

var value: int setget _set_value	# количество энергии
func _set_value(new_value):
	value = new_value
	if parent.is_player:
		Global.gui.charge_indicator.value = value