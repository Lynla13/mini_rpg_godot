extends Resource

class_name Inventory

export var name : String
export(Array, Resource) var items_array = [null] 

# emit signal if append new item to item array
signal _item_change ()
#send add slot signal to list items
signal _add_slot ()
signal _out_of_slot ()

func _add_item_slot () :
	if items_array.size() < Utlize.slot_numbers:
		items_array.append (null)
		return 1
	else :
		return 0

func _add_item (item: Item) :
	for i in range(0, items_array.size()):
		#check if dupplicate items
		if items_array [i] is Item and items_array[i].name == item.name and item.item_type <=1 : 
			items_array [i].quantity += 1
			break
		elif item.item_type >= 2 :
			items_array.insert(0, item)
			break
		elif items_array[i] == null and _add_item_slot () == 1 and item.item_type <=1:
			items_array [i] = item
		else :
				emit_signal("_out_of_slot")
	emit_signal("_item_change")

# Thi function is called in inventory_interface after item_change signal
func _make_item_unique () :
	var unique_items = []
	for item in items_array: 
		if  item is Item : 
			unique_items.append(item.duplicate())
		else :
			unique_items.append(null)
	items_array = unique_items

func _remove_item (item: Item) :
	var index = items_array.find(item,0)
	items_array.pop_at (index)
	print (items_array)
	emit_signal("_item_change")

