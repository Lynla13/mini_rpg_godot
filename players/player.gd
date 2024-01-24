extends KinematicBody2D

export var player : Resource
export var inventory : Resource

var _is_equip :bool =false
signal _toggle_inventory ()
signal _pickup_item ()
signal _weapon_use ()
onready var player_sprite = $Player
var velocity := Vector2.ZERO
onready var jump_velocity : float = ((2.0 * player.jump_height) / player.jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * player.jump_height) / (player.jump_time_to_peak * player.jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * player.jump_height) / (player.jump_time_to_descent * player.jump_time_to_descent)) * -1.0
onready var time_stop : bool = false
onready var effect = $effect
onready var particles_2d = $Particles2D
onready var weapon = $Player/Weapon
onready var top = $Player/Top
onready var bottom = $Player/Bottom
onready var ring = $Player/Ring
onready var bracelet = $Player/Bracelet

func _ready():
	ItemUse.connect("_item_was_used",self , "_use_item_on_player")
	ItemUse.connect("_equip_item" , player, "_equip_item")
	ItemUse.connect("_remove_equip" , player, "_remove_equip")
	ItemUse.connect("_equip_item" , self, "_on_equip_item")
	ItemUse.connect("_remove_equip" , self, "_on_remove_equip")
	ItemUse.connect("_remove_item", inventory, '_remove_item')


func _physics_process(delta):
	velocity.y += _get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and (velocity.y > 620 or is_on_floor() ):
		_jump()
	else : 
		player.is_jump = false 
	if Input.is_mouse_button_pressed(1): 
		emit_signal("_weapon_use")
	_run ()
	velocity = move_and_slide(velocity, Vector2.UP)

func _get_gravity() -> float:
	if velocity.y < 0.0 :
		return jump_gravity
	else :
		return fall_gravity

func _jump():
	player.is_jump = true
	velocity.y = jump_velocity

func _run (): 
	if Input.is_action_pressed("ui_left"):
		player_sprite.scale.x = -4
		particles_2d.process_material.direction.x = 1
		velocity.x = -player.speed
	elif Input.is_action_pressed("ui_right"):
		player_sprite.scale.x = 4
		particles_2d.process_material.direction.x = -1
		velocity.x =  player.speed
	else:
		velocity.x = 0


func _toggle_hud () :
	if Input.is_action_just_pressed("hud"): 
		emit_signal("_toggle_inventory")

func _use_item_on_player () :
	pass


func _on_equip_item (item): 
	var equip_ = item.item
	var equipment_intance = equip_.instance()
	if item.item_type == 2: 		top.add_child(equipment_intance)
	if item.item_type == 3: 		bottom.add_child(equipment_intance)
	if item.item_type == 4: 		ring.add_child(equipment_intance)
	if item.item_type == 5: 		bracelet.add_child(equipment_intance)
	if item.item_type == 6: 		weapon.add_child(equipment_intance)
	if weapon.get_children().size() > 1 : 		weapon.get_child (0).queue_free()
	if top.get_children().size() > 1 : 		top.get_child (0).queue_free()
	if bottom.get_children().size() > 1 : 		bottom.get_child (0).queue_free()
	if ring.get_children().size() > 1 : 		ring.get_child (0).queue_free()
	if bracelet.get_children().size() > 1 : 		bracelet.get_child (0).queue_free()
	
	


func _on_remove_equip (item): 
	if item.item_type == 2 : 		top.get_child (0).queue_free()
	if item.item_type == 3 : 		bottom.get_child (0).queue_free()
	if item.item_type == 4 : 		ring.get_child (0).queue_free()
	if item.item_type == 5 : 		bracelet.get_child (0).queue_free()
	if item.item_type == 6 : 		weapon.get_child (0).queue_free()

#use weapon 
func _on_Player_weapon_use():
	var arr = weapon.get_children()
	if  weapon.get_children() != []: 
		arr [0]._use_weapon ()
	else : 
		return 0

