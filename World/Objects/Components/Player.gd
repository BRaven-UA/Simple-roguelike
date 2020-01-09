extends Component

func _ready() -> void:	# один раз для формирования ссылки, если игрок меняет контролируемый объект, этот компонент переносится в другой объект и срабатывет метод _enter_tree()
	Global.world.player = parent

func _enter_tree() -> void:
	parent.is_player = true

func _exit_tree() -> void:
	parent.is_player = false