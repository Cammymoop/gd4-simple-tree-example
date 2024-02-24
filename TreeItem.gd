extends VBoxContainer

@export var start_collapsed: = false

@onready var show_hide: Button = $PanelContainer/HBoxContainer/ButtonHolder/Button
@onready var margin_container: MarginContainer = $MarginContainer
@onready var child_items: VBoxContainer = $MarginContainer/ChildItems
@onready var label: Label = $PanelContainer/HBoxContainer/Label
@onready var item_stem: ColorRect = $PanelContainer/Uncontainer/ItemStem

var is_open: = true
@export var is_root: = false
@export var text: = "Text"

func _ready() -> void:
	if start_collapsed:
		collapse()
	children_updated()
	set_text(text)
	if is_root:
		item_stem.visible = false

func set_text(new_text: String) -> void:
	text = new_text
	label.text = new_text

func add_child_item(new_child: Control) -> void:
	child_items.add_child(new_child)
	children_updated()

func get_child_item(index: int) -> Control:
	return child_items.get_child(index)

func remove_child_item_at(index: int) -> void:
	child_items.remove_child(child_items.get_child(index))
	children_updated()

func remove_child_item(child: Node) -> void:
	child_items.remove_child(child)
	children_updated()

func children_updated() -> void:
	if child_items.get_child_count() < 1:
		show_hide.visible = false
		hide_children()
	else:
		show_hide.visible = true
		show_children()

func open() -> void:
	is_open = true
	show_hide.text = "v"
	if child_items.get_child_count() > 0:
		show_children()

func show_children() -> void:
	child_items.visible = true
	margin_container.visible = true

func collapse() -> void:
	is_open = false
	show_hide.text = "<"
	hide_children()

func hide_children() -> void:
	child_items.visible = false
	margin_container.visible = false

func _on_button_pressed() -> void:
	if is_open:
		collapse()
	else:
		open()

func _on_plus_more_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			var new_item = load("res://tree_item.tscn").instantiate()
			new_item.text = "Hello %s" % child_items.get_child_count()
			add_child_item(new_item)
