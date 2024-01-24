extends Resource

class_name Enemy

export var name : String
export var texture : Resource
export var  hp : int
export var  mana : int
export var dame : int
export var level : int
export var dash_time : int
export var dive_time : int
export var jump_count : int
export var is_hurt : bool = false
export var is_dead : bool = false
export var effect : PackedScene
