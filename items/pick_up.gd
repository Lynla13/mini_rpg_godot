extends RigidBody2D

onready var texture = $Texture
export var item : Resource
export var inventory : Resource
onready var item_label = $item_label

func _ready():
	if item is Item : 
		texture.texture = item.texture
		item_label.text = item.name
	
func _on_pickup_area_entered(area):
	if item is Item : 
		inventory._add_item (item)
		queue_free()



