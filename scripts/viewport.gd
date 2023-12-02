extends SubViewportContainer

@export var config: Config

func _ready():
	custom_minimum_size = config.window_size
	$GameViewport.size_2d_override_stretch = true
	$GameViewport.size_2d_override = config.viewport_size
