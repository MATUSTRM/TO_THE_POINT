extends Area2D

class_name hp_Player
@export var hp : int 
@export var sprite : Sprite2D

func take_damage(damage : int):
	hp -= damage
	if hp < 1:
		die()
	

func die():
	set_collision_layer_value(2,false)
	sprite.visible = false
