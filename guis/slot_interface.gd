extends MarginContainer

onready var slot = $"."
onready var panel = $Panel
var item_f : Resource
onready var texture = $Panel/TextureRect
var click_cout = 0
onready var equipment = $Panel/Equipment
onready var equipped = $Panel/Equipped

func _ready(): 
	slot.hide()

func _display_items (item) :
	if item is Item:
		slot.show()
		item_f = item
		texture.texture_normal = item.texture
		if item.item_type > 1 : 
			equipment.show ()
		else : 
			equipment.hide ()
		if item.is_equip : 
			equipped.show()
		else : 
			equipped.hide ()
	else : 
		slot.hide()
	


func _on_Item_pressed():
	if item_f is Item and item_f != null: 
		item_f._item_use () 
#		ItemUse._remove_item(item_f)
		ItemUse._on_description_item (item_f) 

func _on_item_click():
	pass # Replace with function body.

func _on_Item_mouse_entered():
	if item_f is Item : 
		ItemUse._on_description_item (item_f)

func _on_Item_gui_input(event):
	if Input.is_mouse_button_pressed(2) and !item_f.is_quickuse: 
		ItemUse._add_quickuse (item_f)
	elif Input.is_mouse_button_pressed(2) and item_f.is_quickuse: 
		ItemUse._remove_quickuse (item_f)
