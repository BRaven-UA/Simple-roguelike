extends Control

const SCALE = 128.0

func _on_resized() -> void:
	$Arrows.material.set_shader_param("ratio", 0.7 * rect_size.x / SCALE)
	$Shadow.material.set_shader_param("ratio", 0.7 * rect_size.x / SCALE)
