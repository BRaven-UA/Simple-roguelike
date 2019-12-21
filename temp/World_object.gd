tool
extends Control

onready var picture = find_node("Picture")

export var _tileset: TileSet
export var _texture_name: String setget _set_texture


func _set_texture(new_value):
#	print(get_rect())
	if new_value:
		var id = _tileset.find_tile_by_name(new_value)
		if id != -1:
			_texture_name = new_value
#			print(_tileset.tile_get_region(id))
#			print(find_node("Picture").get_canvas())
			var tex = _tileset.tile_get_texture(id)
#			tex.draw_rect_region(find_node("Picture").get_canvas(), _tileset.tile_get_region(id), get_rect())
			VisualServer.canvas_item_add_texture_rect_region(get_canvas(), get_rect(), tex.get_rid(), _tileset.tile_get_region(id))
