extends Resource

class_name Player

export var name : String
export var  hp : int = 100
export var  mana : int = 5
export var dame : int = 10
export var money : int = 0
export var speed : int = 300
export var jump_height : int = 300
export var jump_time_to_peak : float
export var jump_time_to_descent: float
export var dash_time : int = 5
export var dive_time : int = 5
export var jump_count : int = 1
export var fly_time : int = 5
export var is_fly : bool = false
export var is_run : bool = false
export var is_jump : bool = false
export var is_fall : bool = false
export var is_dash : bool = false
export var is_dive : bool = false
export var is_through: bool = false
export var is_hurt : bool = false
export var is_dead : bool = false
export var top : Resource = null
export var  bottom : Resource = null 
export var ring : Resource = null
export var bracelet: Resource = null
export var weapon : Resource = null
export var effect_1: Script
export var effect_2: PackedScene


func _remove_equip (item) :
	if item is Item and item.item_type == 2: 
		top = null
	if item is Item and item.item_type == 3: 
		bottom = null
	if item is Item and item.item_type == 4: 
		ring = null
	if item is Item and item.item_type == 5: 
		weapon = null
	if item is Item and item.item_type == 6: 
		bracelet = null
	else : 
		return 0

func _equip_item (item) :
	if item is Item and item.item_type == 2: 
		print (top)
		if top == null: 		top = item
		elif top != null:
			top.is_equip = false
			top = item
	if item is Item and item.item_type == 3: 
		if bottom == null: 		bottom = item
		elif bottom != null:
			bottom.is_equip = false
			bottom = item
	if item is Item and item.item_type == 4: 
		if ring == null: 		ring = item
		elif ring != null:
			ring.is_equip = false
			ring = item
	if item is Item and item.item_type == 6: 
		if bracelet == null: 		bracelet = item
		elif bracelet != null:
			bracelet.is_equip = false
			bracelet = item
	if item is Item and item.item_type == 5: 
		if weapon == null: 		weapon = item
		elif weapon != null:
			weapon.is_equip = false
			weapon = item
	else : 
		return 0
