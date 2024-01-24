extends CanvasLayer

export var player : Resource
onready var detail = $VBoxContainer/HBoxContainer/Detail
onready var item_t = $VBoxContainer/HBoxContainer/Description/Panel/VBoxContainer/Item
onready var description = $VBoxContainer/HBoxContainer/Description/Panel/VBoxContainer/Description
onready var description_bar = $VBoxContainer/HBoxContainer/Description
onready var item_quantity = $VBoxContainer/HBoxContainer/Description/Panel/VBoxContainer/item_quantity
onready var item_type = $VBoxContainer/HBoxContainer/Description/Panel/VBoxContainer/item_type
onready var item_name = $VBoxContainer/HBoxContainer/Description/Panel/VBoxContainer/Item_name
onready var des_panel = $VBoxContainer/HBoxContainer/Description/Panel

onready var texture_rect_1 = $VBoxContainer/HBoxContainer/Quick_use/VBoxContainer/Item2/Item1/TextureRect
onready var label_1 = $VBoxContainer/HBoxContainer/Quick_use/VBoxContainer/Item2/Item1/Label
onready var texture_rect_2 = $VBoxContainer/HBoxContainer/Quick_use/VBoxContainer/Item3/Item1/TextureRect
onready var label_2 = $VBoxContainer/HBoxContainer/Quick_use/VBoxContainer/Item3/Item1/Label
onready var texture_rect_3 = $VBoxContainer/HBoxContainer/Quick_use/VBoxContainer/Item4/Item1/TextureRect
onready var label_3 = $VBoxContainer/HBoxContainer/Quick_use/VBoxContainer/Item4/Item1/Label
onready var texture_rect_4 = $VBoxContainer/HBoxContainer/Quick_use/VBoxContainer/Item5/Item1/TextureRect
onready var label_4 = $VBoxContainer/HBoxContainer/Quick_use/VBoxContainer/Item5/Item1/Label

onready var top = $VBoxContainer/HBoxContainer/Equip/VBoxContainer/Top/Item1/Top
onready var weapon = $VBoxContainer/HBoxContainer/Equip/VBoxContainer/Weapon/Item1/Weapon
onready var bottom = $VBoxContainer/HBoxContainer/Equip/VBoxContainer/Bottom/Item1/Bottom
onready var ring = $VBoxContainer/HBoxContainer/Equip/VBoxContainer/Ring/Item1/Ring
onready var bracelet = $VBoxContainer/HBoxContainer/Equip/VBoxContainer/Bracelet/Item1/Bracelet



func _ready():
	detail.hide()
	description_bar.hide ()
	ItemUse.connect ("_description_item", self , "_on_description_item")
	ItemUse.connect("_reload", self, "_show_quick_use_item")
	ItemUse.connect("_reload", self, "_show_equip_item")
	_show_quick_use_item ()
	_show_equip_item()

func _on_Player__toggle_inventory():
	_inventory_toggle ()

func _inventory_toggle () :
	detail.visible = !detail.visible
	description_bar.visible = !description_bar.visible

func _on_Menu_pressed():
	_inventory_toggle ()

#enum type {Item, Metarial, Top, Bottom, Accessory, Weapon}
func _on_description_item (item) :
	item_t.texture = item.texture
	description.text = str (item.description)
	item_name.text = str (item.name)
	item_quantity.text = "QUANTITY: " + str (item.quantity)
	if item.item_type == 0 : 		item_type.text = "TYPE: Item"
	if item.item_type == 1 : 		item_type.text = "TYPE: Metarial"
	if item.item_type == 2 : 		item_type.text = "TYPE: Top"
	if item.item_type == 3 : 		item_type.text = "TYPE: Bottom"
	if item.item_type == 4 : 		item_type.text = "TYPE: Ring"
	if item.item_type == 5 : 		item_type.text = "TYPE: Bracelet"
	if item.item_type == 6 : 		item_type.text = "TYPE: Weapon"
	if item.is_equip : 		item_type.text = "EQUIPED"
	

func _show_quick_use_item () :
	if ItemUse.quick_items [0] != null: 
		texture_rect_1.texture_normal = ItemUse.quick_items [0].texture
		label_1.text = str (ItemUse.quick_items [0].quantity)
	if ItemUse.quick_items [1] != null: 
		texture_rect_2.texture_normal = ItemUse.quick_items [1].texture
		label_2.text = str (ItemUse.quick_items [1].quantity)
	if ItemUse.quick_items [2] != null: 
		texture_rect_3.texture_normal = ItemUse.quick_items [2].texture
		label_3.text = str (ItemUse.quick_items [2].quantity)
	if ItemUse.quick_items [3] != null: 
		texture_rect_4.texture_normal = ItemUse.quick_items [3].texture
		label_4.text = str (ItemUse.quick_items [3].quantity)
	if ItemUse.quick_items [0] == null: 
		texture_rect_1.texture_normal = null
		label_1.text = ""
	if ItemUse.quick_items [1] == null: 
		texture_rect_2.texture_normal = null
		label_2.text = ""
	if ItemUse.quick_items [2] == null: 
		texture_rect_3.texture_normal = null
		label_3.text = ""
	if ItemUse.quick_items [3] == null: 
		texture_rect_4.texture_normal = null
		label_4.text = ""

func _on_quickuse_1_pressed () :
	if ItemUse.quick_items [0] != null: 
		ItemUse.quick_items [0]. _item_use ()

func _on_quickuse_2_pressed () :
	if ItemUse.quick_items [1] != null: 
		ItemUse.quick_items [1]. _item_use ()

func _on_quickuse_3_pressed () :
	if ItemUse.quick_items [2] != null: 
		ItemUse.quick_items [2]. _item_use ()

func _on_quickuse_4_pressed () :
	if ItemUse.quick_items [3] != null: 
		ItemUse.quick_items [3]. _item_use ()

func _show_equip_item (): 
	if player.top != null: 
		top.texture_normal = player.top.texture
	if player.top == null: 
		top.texture_normal = null
	if player.bottom != null: 
		bottom.texture_normal = player.bottom.texture
	if player.bottom == null: 
		bottom.texture_normal = null
	if player.ring != null: 
		ring.texture_normal = player.ring.texture
	if player.ring == null: 
		ring.texture_normal = null
	if player.bracelet != null: 
		bracelet.texture_normal = player.bracelet.texture
	if player.bracelet == null: 
		bracelet.texture_normal = null
	if player.weapon != null: 
		weapon.texture_normal = player.weapon.texture
	if player.weapon == null: 
		weapon.texture_normal = null


