extends StaticBody2D

onready var timer = $Timer

func _ready():
	pass

func _use_weapon () :
	if timer.is_stopped() : 
		_stick_batch ()
	
#	tween.parallel().tween_property(self,"scale",Vector2(1,4), player.jump_time_to_peak)

func _stick_batch () :
	var tween = get_node("Tween")
	tween.interpolate_property(self, "rotation_degrees",0, 90, 0.1)
	tween.start()
	tween.interpolate_property(self, "rotation_degrees",90, 0, 0.1)
	timer.start ()
