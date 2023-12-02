extends Object
class_name Mission

var action: Global.ia_tag
var object: ItemData

func _init(tag: Global.ia_tag, name: ItemData):
	action = tag
	object = name

func generate_mission_string(encrypted: bool) -> String:
	var a = Global.ia_tag.keys()[action]
	var n = object.name
	if (encrypted):
		return Global.encrypted_actions[a] + " " + Global.encrypted_objects[n]
	else:
		return a + " " + n
