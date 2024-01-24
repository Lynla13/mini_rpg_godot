extends Resource

class_name Item

export var name : String
export var description : String
export var texture : Resource
export var  hp : int
export var  mana : int
export var  count_down : int
enum type {Item, Metarial, Top, Bottom, Ring, Bracelet, Weapon}
export (type) var item_type = 1
export var is_equip : bool  = false
export var is_quickuse : bool  = false
export var dame : int
export var quantity : int = 1
export var item : PackedScene


func _item_use ():
	if quantity >=1: 
		if item_type == 0: 
			quantity -= 1
			ItemUse.item = self
			ItemUse._use_item(self)
		elif item_type > 1  :
			is_equip = !is_equip
			if is_equip : 			ItemUse._equip_item(self)
			elif !is_equip: 			ItemUse._remove_equip (self)

func _unequip () :
	if item_type > 1 :
			is_equip = false


