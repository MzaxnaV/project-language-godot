extends Resource
class_name ItemData

@export var name: String = "": set = set_item_name
@export_multiline var desc: String = ""
@export var texture: AtlasTexture
@export var filled: bool = false
@export var tags: Array[Global.ia_tag]

func set_item_name(value: String) -> void:
	name = value
	Global.randomize_objects(value)
