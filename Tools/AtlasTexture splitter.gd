tool
extends EditorScript

var atlas: Texture = load("res://World/Objects/World_objects.png")
#var atlas: Texture = load("res://GUI/Pictograms/Inteface_pictograms.png")
var texture_size := 128
var output_directory := "res://World/Objects/generated_resources/"
#var output_directory := "res://GUI/Pictograms/generated_resources/"


func _run() -> void:
	var counter := 1
	
	var columns = atlas.get_width() / texture_size
	var rows = atlas.get_height() / texture_size
	
	for row in rows:
		for col in columns:
			var region = Rect2(col * texture_size, row * texture_size, texture_size, texture_size)
			var atlas_texture = AtlasTexture.new()
			atlas_texture.atlas = atlas
			atlas_texture.region = region
			var path = output_directory + "AtlasTexture" + str(counter) + ".tres"
			atlas_texture.resource_path = path
			counter += 1
			if ResourceSaver.save(path, atlas_texture):
				print("FAILED TO SAVE!")
				break