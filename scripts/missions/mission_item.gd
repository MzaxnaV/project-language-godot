extends Label

var mission:: set = set_mission

func set_mission(value: Mission) -> void:
	mission = weakref(value)
	text = mission.get_ref().generate_mission_string(false)

func toggle_encrypted(encryped: bool) -> void:
	text = mission.get_ref().generate_mission_string(encryped)
