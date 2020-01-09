tool
extends EditorScript


func _run():
	var scene = get_scene()
	var viewport = scene.get_viewport()
	viewport.canvas_transform.origin = Vector2(50, 50)