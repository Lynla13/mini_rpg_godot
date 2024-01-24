extends Control

onready var inventory_interface = $"."
export var inventory : Resource 
export var slot : PackedScene
onready var item = $Item

func _ready():
	inventory.connect("_item_change", self, "_update_inventory")
	ItemUse.connect("_reload", self, "_update_inventory")
	inventory.connect("_item_change", inventory, "_make_item_unique")
	inventory._make_item_unique () 

func _update_inventory ():
	for item_index in inventory.items_array.size ():
		_update_inventory_slot(item_index)

func _update_inventory_slot (item_indexs):
	var inventory_slot_display = item.get_child (item_indexs)
	var item = inventory.items_array [item_indexs]
	# call to slot 's function (not slot_base)
	inventory_slot_display._display_items (item)



