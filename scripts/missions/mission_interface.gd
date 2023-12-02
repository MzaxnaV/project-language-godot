extends PanelContainer

const mission_item = preload("res://scenes/mission.tscn")

var encrypted: bool = false

var first_mission = null

@onready var v_box_container = $MissionList/VBoxContainer

@export var mission_no: int = 4
@export var object_list: Array[ItemData]

var all_missions: Array[Mission]

func _ready():
	randomize()
	generate_all_missions()
	generate_missions(mission_no)
	toggle_encrypt_missions()

func _input(event):
	if (event.is_action_released("mission")):
		visible = !visible
	if (event.is_action_released("debug_gen_mission")):
		encrypted = false
		generate_missions(mission_no)
		toggle_encrypt_missions()
	if (event.is_action_released("debug_toggle_encrypt_mission")):
		toggle_encrypt_missions()


func toggle_encrypt_missions() -> void:
	encrypted = !encrypted
	var missions = v_box_container.get_children()
	for m in missions:
		m.toggle_encrypted(encrypted)
	first_mission.toggle_encrypted(false)

func generate_all_missions() -> void:
	all_missions.clear()
	for o in object_list:
		for tag in o.tags:
			var mission = Mission.new(tag, o)
			all_missions.append(mission)


func clear_missions() -> void:
	Global.missions.clear()
	var children = v_box_container.get_children()
	for child in children:
		child.queue_free()


func generate_missions(num: int) -> void:
	var fill_fisrt_mission = true;
	clear_missions()

	num = min(num, all_missions.size())

	while Global.missions.size() < num:
		var index = randi() % all_missions.size()
		var mission: Mission = all_missions[index]

		if not Global.missions.has(mission):
			var m = mission_item.instantiate()
			v_box_container.add_child(m)
			if (fill_fisrt_mission):
				first_mission = m
				fill_fisrt_mission = false
			m.mission = mission
			Global.missions.append(mission)
