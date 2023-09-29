extends Resource
class_name Inventory

signal items_changed(items)

@export var item_slots: Array[Item] = []

func add_item(item):
	if(item is Item):
		print("It's an item")

func remove_item(item):
	if(item is Item):
		print("Yup.")
