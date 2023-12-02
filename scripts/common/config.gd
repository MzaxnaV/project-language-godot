extends Resource
class_name Config

@export var window_size: Vector2i = Vector2i(1152, 648)
@export var factor: int = 4:set = set_factor

var viewport_size: Vector2i

func _init(p_window_size = Vector2i(1152, 648), p_factor = 4):
	window_size = p_window_size
	set_factor(p_factor)
	viewport_size = window_size / p_factor


func set_factor(f: int) -> void:
	factor = f
	if factor <= 1:
		factor = 1
		push_error("invalid factor, setting factor to 1")
