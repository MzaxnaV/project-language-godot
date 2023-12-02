extends PanelContainer

@onready var texture_rect = $MarginContainer/TextureRect

func update_item(item_data: ItemData) -> void:
	if (item_data.texture):
		texture_rect.texture = item_data.texture
		(texture_rect.material as ShaderMaterial).set_shader_parameter("filled", item_data.filled)
	else:
		print("Error: Texture is null for item" + item_data.name)
	tooltip_text = "%s\n%s" % [item_data.name, item_data.desc]
