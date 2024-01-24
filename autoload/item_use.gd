extends Node

var item : Item 
var player : Player
export (Array, Resource) var quick_items = [null, null, null, null]

signal _item_was_used ()
signal _reload ()
signal _use_item (item)
signal _equip_item (item)
signal _add_skill_to_slot (item)
signal _description_item (item)
signal _remove_equip (item)
signal _remove_item (item)

#reload signal is connect with update inventory
#Connect to Player
# from player connect to fitem, inventory
func _use_item (item) :
	emit_signal("_item_was_used")
	emit_signal("_reload")
	
#Connect to Player
# from player connect to inventory _remove_item function
func _remove_item (item) :
	emit_signal("_remove_item", item)
	emit_signal("_reload")

func _on_description_item (item) :
	emit_signal("_description_item", item)

func _remove_quickuse (item) :
	item.is_quickuse = false
	for i in range(0, quick_items.size()):
		if quick_items [i] == item : 
			quick_items [i] = null
	emit_signal("_reload")

func _add_quickuse (item) :
	for i in range(0, quick_items.size()):
		if item is Item and item.item_type == 0: 
			if quick_items [i] == null:
				item.is_quickuse = true
				quick_items [i] = item
				emit_signal("_reload")
				break
			elif quick_items [i].name == item.name : 
				return 0
				
func _equip_item (item_) :
	if item_ is Item: 
		emit_signal("_equip_item", item_)
		emit_signal("_reload")

func _remove_equip (item_): 
	emit_signal("_remove_equip", item_)
	emit_signal("_reload")

