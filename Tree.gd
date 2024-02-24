extends Tree


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = create_item()
	root.set_cell_mode(0, TreeItem.CELL_MODE_CUSTOM)
	root.set_text(0, "hello")
	root.set_editable(0, true)


func _on_custom_item_clicked(mouse_button_index: int) -> void:
	if mouse_button_index == MOUSE_BUTTON_RIGHT:
		print("right click")


func _on_item_selected() -> void:
	print("item selected")
