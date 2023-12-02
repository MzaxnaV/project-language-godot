@tool
extends Node2D

var config: Config = preload("res://data/config.tres")
var boundary = null

func _draw():
	if Engine.is_editor_hint():
		if (boundary == null):
			boundary = Rect2i(Vector2i.ZERO, config.window_size / config.factor)
		draw_rect(boundary, Color.WHITE, false)


