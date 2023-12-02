extends PanelContainer

const Slot = preload("res://scenes/ui/slot.tscn")

@onready var item_grid = $MarginContainer/ItemGrid

func _ready():
	var inv_data = preload("res://data/inventory_data.tres")
	populate_item_grid(inv_data.item_data)

func populate_item_grid(items_data: Array[ItemData]) -> void:
	for child in item_grid.get_children():
		child.queue_free()

	for item_data in items_data:
		var item_slot = Slot.instantiate()
		item_grid.add_child(item_slot)
		item_slot.update_item(item_data)

