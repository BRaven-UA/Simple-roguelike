extends Control

#const SCALE = 128.0

func point_at(target: WorldSector) -> void:
	var distance = target.rect_center - Global.world.sector_current.rect_center
	rect_position = Global.world.sector_current.rect_center - rect_pivot_offset
	rect_size.x = distance.length()
	rect_rotation = rad2deg(Vector2.RIGHT.angle_to(distance))
	visible = true

func _on_resized() -> void:
	# ToDo: переписать шейдер с добавлением тени и фиксированной геометрии стрелок (не зависящей от размера узла)
	$Arrows.material.set_shader_param("ratio", 0.7 * rect_size.x / Global.SECTOR_SIZE)
	$Shadow.material.set_shader_param("ratio", 0.7 * rect_size.x / Global.SECTOR_SIZE)